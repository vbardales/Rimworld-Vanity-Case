using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using HarmonyLib;
using RimWorld;
using UnityEngine;
using Verse;

namespace VanityCase
{
    /// <summary>
    /// Wires the lipstick to Facial Animation (Nals.FacialAnimation) by name, with no compile-time reference: if
    /// the assembly or a member is missing or changed, the mod logs once and the original lips are drawn.
    /// </summary>
    [StaticConstructorOnStartup]
    public static class VanityCaseMod
    {
        private const string LayerName = "VanityCase_Lips";

        private static HashSet<string> sourceMouths = new HashSet<string>();
        private static ApparelLayerDef lipsLayer;
        private static Type mouthCompType;
        private static PropertyInfo faceTypeProperty;
        private static MethodInfo setDirtyMethod;

        static VanityCaseMod()
        {
            try
            {
                Type collection = AccessTools.TypeByName("FacialAnimation.NLGraphic_Collection`1");
                Type mouthShape = AccessTools.TypeByName("FacialAnimation.MouthShapeDef");
                mouthCompType = AccessTools.TypeByName("FacialAnimation.MouthControllerComp");
                if (collection == null || mouthShape == null || mouthCompType == null)
                {
                    Log.Message("[Vanity Case] Facial Animation not found: lipstick colours are off.");
                    return;
                }
                faceTypeProperty = AccessTools.Property(mouthCompType, "FaceType");
                setDirtyMethod = AccessTools.Method(mouthCompType, "SetDirty");
                MethodInfo getSub = AccessTools.Method(collection.MakeGenericType(mouthShape), "GetSubGraphic");
                if (faceTypeProperty == null || setDirtyMethod == null || getSub == null)
                    throw new MissingMemberException("FaceType, SetDirty or GetSubGraphic");

                lipsLayer = DefDatabase<ApparelLayerDef>.GetNamedSilentFail(LayerName);
                sourceMouths = new HashSet<string>(DefDatabase<LipSourceDef>.AllDefs.SelectMany(d => d.mouthDefNames));

                var harmony = new Harmony("nelim.vanitycase");
                harmony.Patch(getSub, postfix: new HarmonyMethod(typeof(VanityCaseMod), nameof(AfterGetSubGraphic)));
                harmony.Patch(AccessTools.Method(typeof(Pawn_ApparelTracker), nameof(Pawn_ApparelTracker.Notify_ApparelAdded)),
                    postfix: new HarmonyMethod(typeof(VanityCaseMod), nameof(AfterApparelChanged)));
                harmony.Patch(AccessTools.Method(typeof(Pawn_ApparelTracker), nameof(Pawn_ApparelTracker.Notify_ApparelRemoved)),
                    postfix: new HarmonyMethod(typeof(VanityCaseMod), nameof(AfterApparelChanged)));
                foreach (MethodBase colourChanged in new[] { AccessTools.Method(typeof(Thing), "Notify_ColorChanged"), AccessTools.DeclaredMethod(typeof(Apparel), "Notify_ColorChanged") })
                    if (colourChanged != null)
                        harmony.Patch(colourChanged, postfix: new HarmonyMethod(typeof(VanityCaseMod), nameof(AfterColourChanged)));
            }
            catch (Exception e)
            {
                Log.Warning("[Vanity Case] Could not hook Facial Animation, lipstick colours are off: " + e.Message);
            }
        }

        private static bool IsLipstick(Apparel apparel) =>
            lipsLayer != null && apparel?.def?.apparel != null && apparel.def.apparel.layers.Contains(lipsLayer);

        private static Color32? WornLipstickColour(Pawn pawn)
        {
            if (pawn?.apparel == null) return null;
            foreach (Apparel apparel in pawn.apparel.WornApparel)
                if (IsLipstick(apparel))
                    return apparel.DrawColor;
            return null;
        }

        private static ThingComp MouthComp(Pawn pawn) =>
            pawn.AllComps.FirstOrDefault(c => mouthCompType.IsInstanceOfType(c));

        private static void AfterGetSubGraphic(Pawn pawn, ref Graphic __result)
        {
            if (__result == null || sourceMouths.Count == 0) return;
            Color32? colour = WornLipstickColour(pawn);
            if (colour == null) return;
            ThingComp comp = MouthComp(pawn);
            if (comp == null) return;
            if (!(faceTypeProperty.GetValue(comp, null) is Def faceType) || !sourceMouths.Contains(faceType.defName)) return;
            __result = LipGraphic.For(__result, colour.Value);
        }

        private static void Refresh(Pawn pawn)
        {
            if (pawn == null) return;
            ThingComp comp = MouthComp(pawn);
            if (comp != null) setDirtyMethod.Invoke(comp, null);
            pawn.Drawer?.renderer?.SetAllGraphicsDirty();
        }

        private static void AfterApparelChanged(Pawn_ApparelTracker __instance, Apparel apparel)
        {
            if (IsLipstick(apparel)) Refresh(__instance.pawn);
        }

        private static void AfterColourChanged(Thing __instance)
        {
            if (__instance is Apparel apparel && IsLipstick(apparel)) Refresh(apparel.Wearer);
        }
    }
}
