# Testing Vanity Case

Written 2026-11-17 (`writeTests[1.0.0]`). Offline checks run on any machine; the in-game scenarios are run by Pickle (`Tests/Pickle/`), never launched by hand from a session.

## Behaviours and how each is proved

| # | Behaviour (what the mod promises) | Offline proof | In-game scenario (`Tests/Pickle/Mod/Pickle/Features/01-lipstick.feature`) |
|---|---|---|---|
| 1 | A worn lipstick gives the painted lips of a Facial Animation mouth its colour | `Tests/Recolour`: reference red maps to the target colour | `lipstick-caramel`, `-rose`, `-berry`, `-forest`: Tester, dark skin, `MouthLipsBig`, one lipstick worn, `@review` face capture |
| 2 | Shading, highlights, teeth and outline stay | `Tests/Recolour`: teeth untouched, transparent pixels untouched, half-bright red stays darker | same captures, read by eye at the portrait zoom |
| 3 | The shade is not darkened by dark skin (skin colour baked into teeth and outline, white lips material) | `Tests/Recolour`: lip shade equals the target under skin (100, 70, 50), teeth take the skin colour, alpha unchanged | the four shade captures on skin (87, 58, 38); seen by SaB on Miel (ticket 4ca4, 2026-11-17) |
| 4 | Only the mouth is recoloured, never the eyes | none (needs the game: the Harmony patch body is shared by all graphic collections) | `lipstick-eyes-unchanged`: Caramel worn, both eyes read equal. WEAK: on this fixture the eyes render plain black (the eye colour step shows nothing without an eyeball type), so it could not have caught the orange left eye; the real proof is SaB on Miel (ticket 61e3, 2026-11-17) |
| 5 | No lipstick worn: the original red lips are drawn | none | `lipstick-none-keeps-red`: same face, nothing worn |
| 6 | Four shade defs exist, one per shade, craftable | `Check-DefRefs` of the shared checks, defs in `Mod/Defs/Lipstick.xml` | the four wear steps resolve `VanityCase_Lipstick<Shade>`; `Check-FeatureDefs.js` found them |
| 7 | Facial Animation absent or changed: the mod logs one warning and does nothing | none | not scripted: needs a pass without Facial Animation, which this mod cannot load without (hard dependency); not applicable: a hard dependency, the mod cannot load without Facial Animation; the one-warning fallback is read in code review 8.m |
| 8 | Taking the lipstick off restores the red lips, dyeing the lipstick changes the shade; an apparel policy picking a shade is game logic, not ours | none | `lipstick-removed-back-to-red`, `lipstick-dyed-berry` (03-remove-dye, `@review` captures). The apparel policy part is not applicable: the game, not this mod, decides what a colonist wears, and the wear step already proves the mod reacts to a worn lipstick. |
| 9 | French labels and descriptions | `Check-Translations.ps1` PASS (10 keys), DefInjected paths resolve | not scripted: `playTests` checks the French texts by eye in the item card |
| 10 | Base recipe: cloth and one berry, no other mod needed | `Check-DefRefs` of the shared checks | `recipe-base-berry` (05-recipe-base, pass `lipstick`): each of the four defs holds `RawBerries` in `costList`. Text format of a costList item unverified until the first run |
| 11 | Optional recipe patches (`Mod/Patches/LipstickIngredients.xml`): with Apothecary (Continued) a lipstick also costs tallow; with EM Tattoos and Piercings (Continued) the berry is replaced by the pigment of the shade (Orange, Red, Purple, Green); neither is a dependency | `Check-OptionalCompat.ps1` OK (2 patched, 2 declared in `Mod/About/OptionalCompat.xml`) | `recipe-apothecary-tallow` and `recipe-em-pigments` (06-recipe-patches, pass `recipepatches`, map `wsl-deps.recipepatches.map`). Unverified before the first run: the game matching the two `PatchOperationFindMod` names, and the dependencies of the EM Continued mod (the map lists none yet) |

## Offline commands

```text
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Run-UnitTests.ps1 -ModRoot .   # harness Tests/Recolour.Tests.csproj (console exe), 7 checks, prints "OK: 7 check(s) passed"
dotnet build Source/VanityCase.csproj -c Release   # DLL into Mod/Assemblies
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-Translations.ps1 -ModRoot .
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-SettingsContract.ps1 -ModRoot .
```

## In-game

One scenario per ticket, pass `lipstick`, map `Tests/Pickle/wsl-deps.lipstick.map`; see `Tests/Pickle/README.md`. The `@review` captures are read by eye: a green step proves only that a file was captured.

## Unit-test harness (AUDIT 7.b)

`Tests/Recolour.Tests.csproj` (console exe, sources in `Tests/Recolour/Program.cs`, compiles `Source/LipRecolour.cs`), run by the shared `Run-UnitTests.ps1`: 7 checks, all green on 2026-11-17. The two-directory mode (`dotnet run --project Tests/Recolour.Tests.csproj -- <lip texture dir> <output dir>`) recolours real VTE lip PNGs for a visual check: a manual extra, not part of the 7.
