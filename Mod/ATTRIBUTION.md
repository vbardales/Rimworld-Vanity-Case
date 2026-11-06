# Attribution

No third-party code or texture is reused in this mod: everything here is written from scratch. Nothing is written yet.

The mod depends on **[NL] Facial Animation - WIP** by Nals (packageId `Nals.FacialAnimation`,
https://steamcommunity.com/sharedfiles/filedetails/?id=1635901197). Its public mouth defs and components are
used as a dependency, never redistributed. Its assembly was decompiled once to understand how a mouth is coloured
and saved (`MouthControllerComp`, `FaceTypeDef.colorMode`); no code of it is copied.

The lips it recolours come from **Vanilla Textures Expanded - [NL] Facial Animation** by the Vanilla Expanded team
(packageId `VanillaExpanded.VTEXE.FacialAnims`, https://steamcommunity.com/sharedfiles/filedetails/?id=2816938779).
Their textures are read at run time from the player's own installation and recoloured in memory only. No file of
that mod is copied into this repository or into the published mod. Its licence was not established: that is why
nothing of it is shipped.

**Licence:** MIT (`LICENSE`).
