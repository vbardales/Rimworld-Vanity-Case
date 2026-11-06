using System;

namespace VanityCase
{
    /// <summary>
    /// Pure pixel maths, no Unity types: moves the red of a painted lip texture to another colour and keeps
    /// the shading. Tested outside the game (Tests/Recolour).
    /// </summary>
    public static class LipRecolour
    {
        // Value and saturation of the VTE lip red (#ED351B): what "full lip" maps to.
        public const float ReferenceValue = 237f / 255f;
        public const float ReferenceSaturation = (237f - 27f) / 237f;

        // Hue window around red, in turns (0..1, wrapping): about -25 to +40 degrees. Teeth (grey, white)
        // fail the saturation test; a dark outline passes only while it is still red.
        private const float MinSaturation = 0.40f;
        private const float MinValue = 0.15f;
        private const float HueBelow = 0.07f;
        private const float HueAbove = 0.11f;

        public static bool IsLipPixel(byte r, byte g, byte b, byte a)
        {
            if (a == 0) return false;
            RgbToHsv(r, g, b, out float h, out float s, out float v);
            if (s < MinSaturation || v < MinValue) return false;
            return h <= HueAbove || h >= 1f - HueBelow;
        }

        /// <summary>Recolours <paramref name="rgba"/> (4 bytes per pixel, straight alpha) in place; returns the pixel count changed.</summary>
        public static int Apply(byte[] rgba, byte tr, byte tg, byte tb)
        {
            RgbToHsv(tr, tg, tb, out float th, out float ts, out float tv);
            int changed = 0;
            for (int i = 0; i + 3 < rgba.Length; i += 4)
            {
                byte r = rgba[i], g = rgba[i + 1], b = rgba[i + 2], a = rgba[i + 3];
                if (!IsLipPixel(r, g, b, a)) continue;
                RgbToHsv(r, g, b, out _, out float s, out float v);
                float nv = Clamp01(tv * (v / ReferenceValue));
                float sr = s / ReferenceSaturation;
                float ns = Clamp01(ts * (sr > 1f ? 1f : sr));
                HsvToRgb(th, ns, nv, out byte nr, out byte ng, out byte nb);
                rgba[i] = nr; rgba[i + 1] = ng; rgba[i + 2] = nb;
                changed++;
            }
            return changed;
        }

        private static float Clamp01(float x) => x < 0f ? 0f : x > 1f ? 1f : x;

        public static void RgbToHsv(byte rb, byte gb, byte bb, out float h, out float s, out float v)
        {
            float r = rb / 255f, g = gb / 255f, b = bb / 255f;
            float max = Math.Max(r, Math.Max(g, b)), min = Math.Min(r, Math.Min(g, b));
            float d = max - min;
            v = max;
            s = max <= 0f ? 0f : d / max;
            if (d <= 0f) { h = 0f; return; }
            if (max == r) h = ((g - b) / d) / 6f;
            else if (max == g) h = (2f + (b - r) / d) / 6f;
            else h = (4f + (r - g) / d) / 6f;
            if (h < 0f) h += 1f;
        }

        public static void HsvToRgb(float h, float s, float v, out byte r, out byte g, out byte b)
        {
            float hh = (h - (float)Math.Floor(h)) * 6f;
            int i = (int)Math.Floor(hh);
            float f = hh - i;
            float p = v * (1f - s), q = v * (1f - s * f), t = v * (1f - s * (1f - f));
            float rr, gg, bb;
            switch (i % 6)
            {
                case 0: rr = v; gg = t; bb = p; break;
                case 1: rr = q; gg = v; bb = p; break;
                case 2: rr = p; gg = v; bb = t; break;
                case 3: rr = p; gg = q; bb = v; break;
                case 4: rr = t; gg = p; bb = v; break;
                default: rr = v; gg = p; bb = q; break;
            }
            r = (byte)Math.Round(rr * 255f); g = (byte)Math.Round(gg * 255f); b = (byte)Math.Round(bb * 255f);
        }
    }
}
