# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it in game.

## [Unreleased]

### Added

- Lipstick: worn clothing with no worn picture, on its own apparel layer (`VanityCase_Lips`) and the mouth body part group. While worn, the painted lips of a Facial Animation mouth take its colour.
- Four shades, one def each so an apparel policy can allow a shade: caramel, rose, berry, forest (`VanityCase_LipstickCaramel`, `Rose`, `Berry`, `Forest`), craftable at a crafting spot or a hand tailoring bench.
- `LipSourceDef` names the mouths whose lips are painted red (the Vanilla Textures Expanded lip mouths). Nothing from another mod is copied: the recolour is made in memory from the installed textures.
- Lip recolour keeps the shading of the original lips and leaves teeth and outline unchanged (`Tests/Recolour`).
