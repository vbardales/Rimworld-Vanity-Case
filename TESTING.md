# Testing Vanity Case

Written 2026-11-17 (`writeTests[1.0.0]`). Offline checks run on any machine; the in-game scenarios are run by Pickle (`Tests/Pickle/`), never launched by hand from a session.

## Behaviours and how each is proved

| # | Behaviour (what the mod promises) | Offline proof | In-game scenario (`Tests/Pickle/Mod/Pickle/Features/01-lipstick.feature`) |
|---|---|---|---|
| 1 | A worn lipstick gives the painted lips of a Facial Animation mouth its colour | `Tests/Recolour`: reference red maps to the target colour | `lipstick-caramel`, `-rose`, `-berry`, `-forest`: Tester, dark skin, `MouthLipsBig`, one lipstick worn, `@review` face capture |
| 2 | Shading, highlights, teeth and outline stay | `Tests/Recolour`: teeth untouched, transparent pixels untouched, half-bright red stays darker | same captures, read by eye at the portrait zoom |
| 3 | The shade is not darkened by dark skin (skin colour baked into teeth and outline, white lips material) | `Tests/Recolour`: lip shade equals the target under skin (100, 70, 50), teeth take the skin colour, alpha unchanged | the four shade captures on skin (87, 58, 38); seen by SaB on Miel (ticket 4ca4, 2026-11-17) |
| 4 | Only the mouth is recoloured, never the eyes | none (needs the game: the Harmony patch body is shared by all graphic collections) | `lipstick-eyes-unchanged`: Caramel worn, eye colour set, both eyes read equal; seen by SaB on Miel (ticket 61e3, 2026-11-17) |
| 5 | No lipstick worn: the original red lips are drawn | none | `lipstick-none-keeps-red`: same face, nothing worn |
| 6 | Four shade defs exist, one per shade, craftable | `Check-DefRefs` of the shared checks, defs in `Mod/Defs/Lipstick.xml` | the four wear steps resolve `VanityCase_Lipstick<Shade>`; `Check-FeatureDefs.js` found them |
| 7 | Facial Animation absent or changed: the mod logs one warning and does nothing | none | not scripted: needs a pass without Facial Animation, which this mod cannot load without (hard dependency); `unverified` |
| 8 | Taking the lipstick off, dyeing it, an apparel policy picking a shade | none | not scripted in this suite: `unverified`, to try by hand or in a later suite |
| 9 | French labels and descriptions | `Check-Translations.ps1` PASS (10 keys), DefInjected paths resolve | not scripted: `playTests` checks the French texts by eye in the item card |

## Offline commands

```text
dotnet run --project Tests/Recolour            # 7 pure checks, prints OK
dotnet build Source/VanityCase.csproj -c Release   # DLL into Mod/Assemblies
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-Translations.ps1 -ModRoot .
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-SettingsContract.ps1 -ModRoot .
```

## In-game

One scenario per ticket, pass `lipstick`, map `Tests/Pickle/wsl-deps.lipstick.map`; see `Tests/Pickle/README.md`. The `@review` captures are read by eye: a green step proves only that a file was captured.
