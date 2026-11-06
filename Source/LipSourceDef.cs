using System.Collections.Generic;
using Verse;

namespace VanityCase
{
    /// <summary>
    /// Names the Facial Animation mouth types whose lips are painted red into the texture, so a lipstick can
    /// recolour them. An explicit list: nothing is guessed from pixels. Names are plain strings, so a mouth of a
    /// mod that is not installed is simply never matched.
    /// </summary>
    public class LipSourceDef : Def
    {
        public List<string> mouthDefNames = new List<string>();
    }
}
