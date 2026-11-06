// Proof of the lip recolour maths, outside the game.
// Usage: Recolour.Tests [lip texture dir] [output dir]
// Pure checks always run. With two directories it also recolours every PNG found (real VTE lip textures) in four
// colours, checks that alpha never changes, and writes the results for a visual check.
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using VanityCase;

internal static class Program
{
    private static int fails;

    private static void Check(bool ok, string what)
    {
        if (ok) return;
        fails++;
        Console.WriteLine("FAIL " + what);
    }

    private static int Main(string[] args)
    {
        var px = new byte[] { 0xED, 0x35, 0x1B, 255 };
        LipRecolour.Apply(px, 0x22, 0x6E, 0x42);
        Check(Math.Abs(px[0] - 0x22) <= 1 && Math.Abs(px[1] - 0x6E) <= 1 && Math.Abs(px[2] - 0x42) <= 1,
            "reference red maps to the target, got " + px[0] + "," + px[1] + "," + px[2]);
        var teeth = new byte[] { 240, 240, 235, 255 };
        Check(LipRecolour.Apply(teeth, 0x22, 0x6E, 0x42) == 0 && teeth[0] == 240, "teeth untouched");
        var clear = new byte[] { 237, 53, 27, 0 };
        Check(LipRecolour.Apply(clear, 0x22, 0x6E, 0x42) == 0, "transparent pixel untouched");
        var dark = new byte[] { 118, 26, 13, 255 };
        LipRecolour.Apply(dark, 0x22, 0x6E, 0x42);
        Check(dark[1] > dark[0] && dark[1] > dark[2] && dark[1] < 0x6E, "half-bright red stays darker than the target");

        if (args.Length == 2)
        {
            Directory.CreateDirectory(args[1]);
            var targets = new[] { ("forest", 0x22, 0x6E, 0x42), ("caramel", 196, 118, 86), ("rose", 186, 82, 120), ("berry", 128, 32, 64) };
            foreach (string file in Directory.GetFiles(args[0], "*.png", SearchOption.AllDirectories))
            {
                using var bmp = new Bitmap(file);
                var rgba = new byte[bmp.Width * bmp.Height * 4];
                for (int y = 0; y < bmp.Height; y++)
                    for (int x = 0; x < bmp.Width; x++)
                    {
                        Color c = bmp.GetPixel(x, y);
                        int i = (y * bmp.Width + x) * 4;
                        rgba[i] = c.R; rgba[i + 1] = c.G; rgba[i + 2] = c.B; rgba[i + 3] = c.A;
                    }
                int opaque = 0, lip = 0;
                for (int i = 0; i < rgba.Length; i += 4)
                {
                    if (rgba[i + 3] > 0) opaque++;
                    if (LipRecolour.IsLipPixel(rgba[i], rgba[i + 1], rgba[i + 2], rgba[i + 3])) lip++;
                }
                string rel = Path.GetRelativePath(args[0], file).Replace('\\', '_').Replace('/', '_');
                Console.WriteLine($"{rel}: {bmp.Width}x{bmp.Height} opaque {opaque} lip {lip}");
                foreach (var (name, tr, tg, tb) in targets)
                {
                    var copy = (byte[])rgba.Clone();
                    LipRecolour.Apply(copy, (byte)tr, (byte)tg, (byte)tb);
                    using var o = new Bitmap(bmp.Width, bmp.Height, PixelFormat.Format32bppArgb);
                    for (int y = 0; y < bmp.Height; y++)
                        for (int x = 0; x < bmp.Width; x++)
                        {
                            int i = (y * bmp.Width + x) * 4;
                            Check(copy[i + 3] == rgba[i + 3], "alpha changed in " + rel);
                            o.SetPixel(x, y, Color.FromArgb(copy[i + 3], copy[i], copy[i + 1], copy[i + 2]));
                        }
                    o.Save(Path.Combine(args[1], name + "_" + rel), ImageFormat.Png);
                }
            }
        }
        Console.WriteLine(fails == 0 ? "OK" : fails + " failure(s)");
        return fails == 0 ? 0 : 1;
    }
}
