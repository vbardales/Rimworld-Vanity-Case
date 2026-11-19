# In-game scenarios, run by Pickle

Played inside a running RimWorld by [Pickle](https://github.com/RimWorks/Rimworld-Pickle) (`rimworks.pickle`, Workshop 3791648678). `Mod/` is a companion mod, **Vanity Case - Pickle tests**, never published: it holds the feature file. Nothing here clicks through OS input. Written 2026-11-17; run results are in `Docs/runs/pickle.md` and `STATUS.md`.

| Feature | Pass | Checks |
| --- | --- | --- |
| `06-recipe-patches` | `wsl-deps.recipepatches.map` | Two scenarios: with Apothecary (Continued) each lipstick has `AYTallow` in its `costList`; with EM Tattoos and Piercings (Continued) the berry is replaced by the pigment of the shade. Written 2026-11-20, not yet run; the EM mod dependencies are not in the map yet. |
| `05-recipe-base` | `wsl-deps.lipstick.map` | Base recipe: each lipstick holds `RawBerries` in `costList`. Written 2026-11-20, not yet run. |
| `03-remove-dye` | `wsl-deps.lipstick.map` | Caramel worn then removed (red lips return), Caramel dyed berry. Written 2026-11-17, not yet run. |
| `02-french` | `wsl-deps.lipstick.map` | Run with -Language French: exact French label and description of the 4 lipsticks, no mod options page, info card of Caramel (capture to read by eye). Written 2026-11-17 on PiT advice, not yet run. |
| `01-lipstick` | `wsl-deps.lipstick.map` | Six scenarios on a dark-skinned colonist with `MouthLipsBig`: no lipstick (original red), Caramel, Rose, Berry, Forest, and Caramel with the eyes read equal. The step asserts the mouth def; the colour is read on the `@review` capture. |

Pass matrix: two passes, `lipstick` (features 01 to 05, no optional mod) and `recipepatches` (feature 06, adds Apothecary (Continued) and EM Tattoos and Piercings (Continued), the optional integrations of `Mod/Patches/LipstickIngredients.xml`). No optional integration (VTE - Facial Animation supplies the painted lips and is in the map), no DLC dependency, English only (the mod has no Keyed text; the French labels are read at `playTests`). Restart sequence: not relevant.

Run one scenario per ticket, from the protocols root:

```text
Submit-PickleRun.ps1 -Mod VanityCase -Owner local_<id> -Label "lipstick caramel" -DepMap wsl-deps.lipstick.map -Filter "01-lipstick::lipstick-caramel" -EvidenceDir Tests/Pickle/Inbox/lipstick-caramel
```

Prior evidence from another suite: SanctuaryBacklot tickets 4ca4 and 61e3 (Miel, 2026-11-17) saw the same behaviour; it is not a proof of this suite.

2026-11-17: the camera and full-screen screenshot steps were dropped (the 1.7 lane timed out on `the camera is centered on` in tickets fb55 and 83ab, even after `the game is advanced by 60 ticks`); the evidence is the face portrait of each scenario.
