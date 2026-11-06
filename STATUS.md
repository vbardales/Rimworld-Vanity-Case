---
mod: Vanity Case
packageId: nelim.vanitycase
repo: Rimworld-Vanity-Case
remote: https://github.com/vbardales/Rimworld-Vanity-Case.git
visibility: public             # original creation, nothing taken from another mod (PUBLISHING.md, "Nommage"); the GitHub repository is not created yet
detached: yes
workflow_stage: makeSources
licence: original
licence_at: "2026-11-06: original work, MIT (LICENSE and Mod/LICENSE). No third-party file: Facial Animation (Nals) is a dependency, Vanilla Textures Expanded - Facial Animation lips are recoloured in memory at run time, never copied (Docs/DESIGN-LIP-COLOURS.md)."
upstream_mod_remotes: N/A      # no source mod: Facial Animation and VTE - Facial Animation are a dependency and an optional input, none of their files is used
settings_audit: unchecked
localization: unchecked
translation_en: unchecked
translation_fr: unchecked
dependencies: unchecked
workshop: none
published: no
tested_on: never
remaining:
  - "2026-11-06: 1.c done: name chosen by Virginie: display Vanity Case, folder VanityCase, packageId nelim.vanitycase, repo Rimworld-Vanity-Case (bare name, original creation; Makeup Mod 3810397741 already uses the word Makeup)."
  - "2026-11-06: 1.e, 1.f, 1.i done: public GitHub repository Rimworld-Vanity-Case created (Virginie go), remote origin set, first commit pushed."
  - "2026-11-06: feature: lip colours, approach in Docs/DESIGN-LIP-COLOURS.md (recolour installed VTE lip textures in memory on demand, Harmony postfix on Facial Animation's MouthControllerComp.LoadTextures, nothing shipped). Virginie: any colour per pawn (example forest green #226E42 to match Miel's underwear, test copy NsbMouthLipsBigForest in NsbFaceFit), ideally per outfit or occasion. Caramel, Rose, Berry are presets only. Virginie 2026-11-06 (final): the lip colour follows the lipstick worn: lipstick = colourable apparel with no worn graphic on its own layer; outfits and occasions go through the apparel policy, matching an outfit is a dye. One lipstick def per shade family (Virginie 2026-11-06), so each occasion's apparel policy picks the shade; first shades Caramel, Rose, Berry, Forest #226E42, list to settle. Open: dye needs Ideology, mouth body part group, recipe and cost."
  - "2026-11-06: 1.a done: duplicate search (Search-Workshop.sh, pattern lipstick or makeup, run makeup-dup): no mod recolours Facial Animation lips. Makeup Mod (BigOlBullseye.MakeupMod, 3810397741) is a craftable beauty item with no visual; Roo's Tattoos and Roo's Birthmarks and Blemishes are skin marks, not lips."
updated: 2026-11-06
protocols_read_sha: cdecf8763e589d6257a4225e7c4de5127760fdb0
---

# Vanity Case: status

Current state only: the front matter above is the source of truth, run lines go to `Docs/runs/`.
Check it with `scripts/Check-Status.ps1 -Mod VanityCase` (no ERROR).

## State

Repository set up, now at `makeSources` (ModIcon and Preview sources are the owner's): About.xml, README, ATTRIBUTION, CHANGELOG, LICENSE, design note. No code.
The test prototype stays in `SanctuaryBacklot/Tests/Pickle/LocalMods/NsbFaceFit` (test-only, never
published: it carries recoloured copies of VTE textures).
