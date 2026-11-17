# In-game scenarios, run by Pickle

Played inside a running RimWorld by [Pickle](https://github.com/RimWorks/Rimworld-Pickle) (`rimworks.pickle`, Workshop 3791648678). `Mod/` is a companion mod, **Vanity Case - Pickle tests**, never published: it holds the feature file. Nothing here clicks through OS input. Written 2026-11-17, not yet run on this suite.

| Feature | Pass | Checks |
| --- | --- | --- |
| `01-lipstick` | `wsl-deps.lipstick.map` | Six scenarios on a dark-skinned colonist with `MouthLipsBig`: no lipstick (original red), Caramel, Rose, Berry, Forest, and Caramel with the eyes read equal. The step asserts the mouth def; the colour is read on the `@review` capture. |

Pass matrix: one pass, `lipstick`. No optional integration (VTE - Facial Animation supplies the painted lips and is in the map), no DLC dependency, English only (the mod has no Keyed text; the French labels are read at `playTests`). Restart sequence: not relevant.

Run one scenario per ticket, from the protocols root:

```text
Submit-PickleRun.ps1 -Mod VanityCase -Owner local_<id> -Label "lipstick caramel" -DepMap wsl-deps.lipstick.map -Filter "01-lipstick::lipstick-caramel" -EvidenceDir Tests/Pickle/Inbox/lipstick-caramel
```

Prior evidence from another suite: SanctuaryBacklot tickets 4ca4 and 61e3 (Miel, 2026-11-17) saw the same behaviour; it is not a proof of this suite.
