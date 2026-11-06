using System.Collections.Generic;
using UnityEngine;
using Verse;

namespace VanityCase
{
    /// <summary>
    /// A mouth graphic whose four materials carry recoloured copies of the textures of another graphic.
    /// Built on demand, one per (original graphic, colour), on the main thread while drawing.
    /// </summary>
    public class LipGraphic : Graphic
    {
        private static readonly Dictionary<(int, uint), Texture2D> TextureCache = new Dictionary<(int, uint), Texture2D>();
        private static readonly Dictionary<(Graphic, uint), Graphic> GraphicCache = new Dictionary<(Graphic, uint), Graphic>();

        private readonly Material[] mats = new Material[4];

        public override Material MatSingle => mats[2];
        public override Material MatSouth => mats[2];
        public override Material MatEast => mats[1];
        public override Material MatNorth => mats[0];
        public override Material MatWest => mats[3];

        public override Material MatAt(Rot4 rot, Thing thing = null) => mats[rot.AsInt];

        public override Graphic GetColoredVersion(Shader newShader, Color newColor, Color newColorTwo) => this;

        /// <summary>The recoloured version of <paramref name="original"/>, or the original if it cannot be built.</summary>
        public static Graphic For(Graphic original, Color32 colour)
        {
            uint key = (uint)(colour.r << 16 | colour.g << 8 | colour.b);
            if (GraphicCache.TryGetValue((original, key), out Graphic cached)) return cached;
            Graphic made = Build(original, colour, key) ?? original;
            GraphicCache[(original, key)] = made;
            return made;
        }

        private static Graphic Build(Graphic original, Color32 colour, uint key)
        {
            var graphic = new LipGraphic { drawSize = original.drawSize, data = original.data, path = original.path, color = original.color, colorTwo = original.colorTwo };
            for (int i = 0; i < 4; i++)
            {
                Material source = original.MatAt(new Rot4((byte)i));
                if (source == null || !(source.mainTexture is Texture2D tex)) return null;
                var material = new Material(source) { mainTexture = Recoloured(tex, colour, key) };
                graphic.mats[i] = material;
            }
            return graphic;
        }

        private static Texture2D Recoloured(Texture2D source, Color32 colour, uint key)
        {
            if (TextureCache.TryGetValue((source.GetInstanceID(), key), out Texture2D cached)) return cached;
            int w = source.width, h = source.height;
            RenderTexture rt = RenderTexture.GetTemporary(w, h, 0, RenderTextureFormat.ARGB32, RenderTextureReadWrite.sRGB);
            Graphics.Blit(source, rt);
            RenderTexture previous = RenderTexture.active;
            RenderTexture.active = rt;
            var copy = new Texture2D(w, h, TextureFormat.RGBA32, false);
            copy.ReadPixels(new Rect(0, 0, w, h), 0, 0);
            RenderTexture.active = previous;
            RenderTexture.ReleaseTemporary(rt);

            Color32[] pixels = copy.GetPixels32();
            var rgba = new byte[pixels.Length * 4];
            for (int i = 0; i < pixels.Length; i++)
            {
                rgba[i * 4] = pixels[i].r; rgba[i * 4 + 1] = pixels[i].g; rgba[i * 4 + 2] = pixels[i].b; rgba[i * 4 + 3] = pixels[i].a;
            }
            LipRecolour.Apply(rgba, colour.r, colour.g, colour.b);
            for (int i = 0; i < pixels.Length; i++)
                pixels[i] = new Color32(rgba[i * 4], rgba[i * 4 + 1], rgba[i * 4 + 2], rgba[i * 4 + 3]);

            var result = new Texture2D(w, h, TextureFormat.RGBA32, true) { filterMode = source.filterMode, wrapMode = TextureWrapMode.Clamp, anisoLevel = source.anisoLevel };
            result.SetPixels32(pixels);
            result.Apply(true, true);
            Object.Destroy(copy);
            TextureCache[(source.GetInstanceID(), key)] = result;
            return result;
        }
    }
}
