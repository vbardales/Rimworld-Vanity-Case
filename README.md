# Vanity Case

Makeup for colonists drawn with [NL] Facial Animation. Work in progress, nothing is playable yet. RimWorld latest version.

## Idea

The full lips of Vanilla Textures Expanded - [NL] Facial Animation (`MouthLipsBig` and its kin) are painted bright red (#ED351B) into the texture. Facial Animation tints a mouth with the skin colour at most, so a player cannot change the lip colour, and that red clashes with some skins (very dark skin first of all).

First feature: a lip colour per colonist, chosen from a palette. Tattoos and other makeup may follow.

## How (planned)

No texture of another mod is shipped. At startup the mod reads the lip textures the player already has installed, recolours the red lip pixels in memory for each palette colour, and offers the results as extra Facial Animation mouth types. The colonist keeps the chosen mouth the way Facial Animation already saves it. Design note: [`Docs/DESIGN-LIP-COLOURS.md`](Docs/DESIGN-LIP-COLOURS.md).

## Licence

MIT (`LICENSE`). Credits: `ATTRIBUTION.md`.
