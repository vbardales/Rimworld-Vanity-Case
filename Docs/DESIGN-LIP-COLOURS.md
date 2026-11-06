# Design: lip colours

Status: chosen approach, not written yet (2026-11-06). Read before the `code` stage.

## The problem

Vanilla Textures Expanded - [NL] Facial Animation (`VanillaExpanded.VTEXE.FacialAnims`, Workshop 2816938779)
defines `MouthLipsBig` and other painted mouths as `FacialAnimation.MouthTypeDef` with `shader` `Map/Transparent`
and textures under `Things/Pawn/Humanlike/Mouth/LipsBig/<Gender>/<shape>_<rot>`. The red (#ED351B) is drawn into
the texture. The mod ships each texture as `.png` and `.dds`; RimWorld loads the `.dds`.

What Facial Animation (`Nals.FacialAnimation`, Workshop 1635901197, `1.6/Assemblies/FacialAnimation.dll`) does with
a mouth, read from the decompiled assembly:

- `MouthControllerComp` (a `ControllerBaseComp<MouthTypeDef, MouthShapeDef>`) builds its graphic from
  `FaceTypeDef.texPath`, `shader` and a colour. The colour comes from `FaceTypeDef.colorMode`; the mouth default
  is the skin colour (`CompDefaultCurrentColor` returns `pawn.story.SkinColor`).
- The comp saves the chosen `faceType` by defName and the colour (`Scribe_Values`). On load an unknown defName
  is ignored (`GetNamedSilentFail`) and the comp picks a new type.
- The in-game face editor (`NL_SelectPartWindow`) offers a colour picker for eyes only, not for the mouth.
- `FaceTypeGenerator<T>` filters `DefDatabase<T>.AllDefs` lazily (race, gender, `targetGeneDefs`), so a
  `MouthTypeDef` added at run time is seen by the selector and by random generation.

So a colour multiplier cannot fix the lips: multiplying a saturated red only darkens it, the teeth and outline
would take the colour too, and the mouth colour slot already carries the skin colour.

## Options weighed

1. **Ship recoloured textures** (what the test prototype `SanctuaryBacklot/Tests/Pickle/LocalMods/NsbFaceFit`
   does: Caramel 196,118,86; Rose 186,82,120; Berry 128,32,64). Simplest, proven in game. Rejected for a published
   mod: the textures are derived from Vanilla Expanded files whose licence was not established, so shipping them is
   redistribution of another author's art. It would need written permission from the Vanilla Expanded team, and
   it covers only the mouths someone recoloured by hand. The prototype stays test-only and unpublished.
2. **Tint through the shader** (`colorMode`, `shaderColorOverride`, a mask). Rejected: see above, the red is
   baked, the tint is multiplicative and covers the whole mouth.
3. **Our own lip textures, drawn from scratch** (a separate lip layer, or our own mouth types). Clean licence,
   but it is new art for every mouth shape and facing, and it would not match the VTE mouths the colonists
   already wear.
4. **Recolour in memory at startup (chosen).** Read the installed lip textures, recolour only the lip pixels,
   and register the results as new mouth types.

## Requirements (Virginie, 2026-11-06)

- **Any colour per pawn**, not a fixed palette. Example: forest green #226E42 to match Miel's underwear (test copy
  `NsbMouthLipsBigForest` in `NsbFaceFit`). Caramel, Rose, Berry stay as presets in the picker, nothing more.
- **Lipstick that matches the outfit**: ideally set per outfit or per occasion, not once for the pawn.

## Chosen approach

- **Source mouths as defs.** A small def lists which `MouthTypeDef`s carry painted lips (`MouthLipsBig` and the
  other VTE lip mouths, each with `MayRequire="VanillaExpanded.VTEXE.FacialAnims"`). An explicit list, no guessing
  from pixels.
- **Recolour on demand, on the main thread, cached.** Key = (source mouth, colour). For each gender folder, shape
  and facing of that mouth: take the loaded `Texture2D` from `ContentFinder`, copy it through a `RenderTexture`
  (`Graphics.Blit` then `ReadPixels`, which also works on the compressed `.dds`), then move every pixel whose hue is
  in the lip red band to the target colour while keeping its own lightness, so shading and highlights stay. Teeth,
  outline and transparent pixels do not change. Colours are rounded to 8 bits per channel so the cache key is
  stable; the cache holds only the colours pawns actually wear.
- **Register the result as content of this mod** under a generated path such as
  `VanityCase/Lips/<sourceDef>/<RRGGBB>/<Gender>/<shape>_<rot>`, so Facial Animation's own
  `GraphicDatabase.Get` finds it like any texture.
- **Hook into Facial Animation's mouth graphic (as built, 2026-11-06)** (Harmony postfix on `NLGraphic_Collection<MouthShapeDef>.GetSubGraphic`, patched by name through reflection, no compile-time reference to Facial Animation; `LipGraphic` wraps recoloured copies of the four materials): when the
  pawn wears a lipstick and a listed source mouth, return the recoloured graphic; otherwise leave it alone. The pawn keeps its own `MouthTypeDef`, so Facial Animation's save and
  editor are untouched, and removing the mod restores the original lips. Changing the colour calls `SetDirty()` on
  the comp so the graphic is rebuilt. (A generated `MouthTypeDef` per colour, the first idea, does not fit any
  colour: it would add a def per colour ever picked.)
- **The colour follows the lipstick the pawn wears** (Virginie, 2026-11-06, replacing the earlier per-pawn and
  per-policy settings). A lipstick is an apparel item:
  - a `ThingDef` apparel with no worn graphic, on its own `ApparelLayerDef` (`VanityCase_Lips`) and a mouth-level
    body part group, so it conflicts with nothing else the pawn wears;
  - colourable (`CompColorable`): its colour is any RGB, set when made or by dye at the styling station;
  - worn, the lips take its `DrawColor`; not worn, the mouth keeps its original red. Putting it on, taking it off
    or dyeing it marks the mouth dirty, so the lips follow.
  - Per outfit or occasion comes from the game itself: the apparel policy of the occasion lets the pawn wear the
    lipstick, and matching an outfit (Miel's forest green #226E42) is a dye of the lipstick.
  - Caramel, Rose, Berry: default colours of the crafted item or recipe variants.
- **Open points for `code`:**
  - **One lipstick def per shade family** (Virginie, 2026-11-06), because an apparel policy filters by def, not by
    colour: the occasion's policy allows the shade ("rose for the ball, green for the beach"). Each def has a
    default colour (Caramel, Rose, Berry, Forest #226E42 to start); a dye still fine-tunes within the family.
    Shared parent def (abstract) for layer, group, comps. Shade list to settle with Virginie.
  - Dyeing at the styling station needs Ideology; without it, the colour is fixed at crafting (recipe per colour,
    or a colour dialog on the item). Check which DLCs her game runs.
  - Body part group: vanilla has no plain "mouth" group for apparel; check `Teeth`/`Jaw` or add one, without
    blocking masks or helmets (layer is separate, so only the group can clash).
  - Recipe, workbench, cost, wear (does lipstick wear out like makeup?) to decide with Virginie.
- **Dependency:** Facial Animation required. VTE - Facial Animation optional: without it the source list is empty
  and the mod does nothing.

## Licence

Nothing of another mod is shipped: no texture, no code. The recoloured images exist only in memory, on the
player's machine, made from files the player installed. That is the same position as any mod that tints another
mod's graphic at run time. `ATTRIBUTION.md` credits Nals and the Vanilla Expanded team and says this. If a later
feature needs shipped textures (tattoos, for example), they are drawn for this mod or used with written permission.

## Risks to check at `code`

- Orientation and colour space of the copy from a `.dds` (`Graphics.Blit` and `ReadPixels` with the right
  `RenderTextureReadWrite` mode, so colours are not shifted by sRGB).
- The red band: VTE red #ED351B; check the hue and saturation thresholds on every VTE lip mouth (normal, open,
  and any other shape), and that teeth and dark outlines stay untouched.
- The Harmony postfix on `LoadTextures`: Facial Animation is closed source and WIP; pin the method signature in a
  test and fail soft (log once, original lips) if it changes.
- Recolour cost on a colour change: a few small textures, main thread; keep it off the per-frame path.
- A hue band tuned on VTE red may not suit lip mouths of other face mods; the source list keeps that explicit.
