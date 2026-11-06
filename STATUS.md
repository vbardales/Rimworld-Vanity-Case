---
mod: Vanity Case
packageId: nelim.vanitycase
repo: Rimworld-Vanity-Case
remote: https://github.com/vbardales/Rimworld-Vanity-Case.git
visibility: public             # original creation, nothing taken from another mod (PUBLISHING.md, "Nommage"); the GitHub repository is not created yet
detached: yes
workflow_stage: declareDependencies[1.0.0]
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
  - "2026-11-06: SLEEP HAND-OVER. Session code VaC, parent session NSB (local_9922b4f6-0833-4621-88dd-c02bcbb7e20e, waits to know the lip shades; it already asked for any colour per pawn, outfit match, done as one def per shade). Next moves in order: (1) 4.a to 4.g: write the dependency record in STATUS.md (Facial Animation Nals.FacialAnimation and Harmony brrainz.harmony hard, VTE VanillaExpanded.VTEXE.FacialAnims optional through loadAfter and LipSourceDef, DLC none, date and revision), set dependencies, then 4.h to settings; (2) ask Virginie to file a Pickle ticket (Miel, MouthLipsBig, forest lipstick, capture) at playTests via file-pickle-ticket; never launch RimWorld; (3) open decisions for her: recipe cost (Cloth x1 placeholder), real lipstick icon art (Mod/Textures/VanityCase/Lipstick.png is a programmatic placeholder), final shade list, dye needs Ideology. NsbFaceFit prototype stays test-only in SanctuaryBacklot. Hand-over note: side-session-notes/local_9922b4f6-.../nsb-makeup-setup.md."
  - "2026-11-06: REPLAY (audit-replay): 1.a to 3.d done (1.a search run makeup-dup; 1.b original MIT; 1.c names; 1.d public, no suffix; 1.e repo exists; 1.f git + remote; 1.g docs; 1.h STATUS; 1.i commits; 1.j Check-Status 0; 2.a-2.f sources and derivatives read; 3.a features implemented; 3.b build DLL SAME (sha256 2a7bc7cf); 3.c CHANGELOG). Fix in place: About.xml <url> added. Now at declareDependencies[1.0.0]: 4.a to 4.g open (real dependencies Facial Animation and Harmony hard, VTE optional via loadAfter and the source list; dependency record dated with the revision still to write, dependencies: unchecked), then 4.h. Later stages, not blocking: Preview.png (mountPreview), French (localize), Pickle proof of the lipstick (playTests)."
  - "2026-11-06: makeSources done: Art/ModIcon-source.png (owner, winking smiley with a vanity case) and Art/Preview-source.png (owner, 1672x941, palette 2 families, Vmean 0.597) received and conform; derivatives Mod/About/ModIcon.png (128x128, 21.9 KB) and Art/ModIcon.ico made; PROMPT_VANITYCASE.md deleted. Mod/About/Preview.png is rendered at mountPreview. Next: code[1.0.0] (lipstick defs, recolour, Harmony patch, Docs/DESIGN-LIP-COLOURS.md)."
  - "2026-11-06: 1.c done: name chosen by Virginie: display Vanity Case, folder VanityCase, packageId nelim.vanitycase, repo Rimworld-Vanity-Case (bare name, original creation; Makeup Mod 3810397741 already uses the word Makeup)."
  - "2026-11-06: 1.e, 1.f, 1.i done: public GitHub repository Rimworld-Vanity-Case created (Virginie go), remote origin set, first commit pushed."
  - "2026-11-06: CODE written (lipstick defs, LipRecolour maths with a tested proof in Tests/Recolour on real VTE textures, LipGraphic, Harmony hooks by reflection), build 0 warnings, DLL in Mod/Assemblies; NOT yet seen in game (unverified: the GetSubGraphic hook, mouth refresh on wear and on dye, apparel policy, no worn graphic). Placeholders to replace: Mod/Textures/VanityCase/Lipstick.png is a programmatic stand-in (owner art needed), recipe cost Cloth x1 (decide), no DefInjected French yet (localize stage). Next: a Pickle scenario (Miel with MouthLipsBig wearing forest lipstick, capture), then declareDependencies."
  - "2026-11-06: unverified: lip colours (implemented, 3.a closed), approach in Docs/DESIGN-LIP-COLOURS.md (recolour installed VTE lip textures in memory on demand, Harmony postfix on Facial Animation's MouthControllerComp.LoadTextures, nothing shipped). Virginie: any colour per pawn (example forest green #226E42 to match Miel's underwear, test copy NsbMouthLipsBigForest in NsbFaceFit), ideally per outfit or occasion. Caramel, Rose, Berry are presets only. Virginie 2026-11-06 (final): the lip colour follows the lipstick worn: lipstick = colourable apparel with no worn graphic on its own layer; outfits and occasions go through the apparel policy, matching an outfit is a dye. One lipstick def per shade family (Virginie 2026-11-06), so each occasion's apparel policy picks the shade; first shades Caramel, Rose, Berry, Forest #226E42, list to settle. Open: dye needs Ideology, mouth body part group, recipe and cost."
  - "2026-11-06: 1.a done: duplicate search (Search-Workshop.sh, pattern lipstick or makeup, run makeup-dup): no mod recolours Facial Animation lips. Makeup Mod (BigOlBullseye.MakeupMod, 3810397741) is a craftable beauty item with no visual; Roo's Tattoos and Roo's Birthmarks and Blemishes are skin marks, not lips."
updated: 2026-11-06
protocols_read_sha: 34a936a89961e083ecbe860f6e25ce791461015b
---

# Vanity Case: status

Current state only: the front matter above is the source of truth, run lines go to `Docs/runs/`.
Check it with `scripts/Check-Status.ps1 -Mod VanityCase` (no ERROR).

## State

Repository set up, now at `code[1.0.0]`: About.xml, README, ATTRIBUTION, CHANGELOG, LICENSE, design note. No code.
The test prototype stays in `SanctuaryBacklot/Tests/Pickle/LocalMods/NsbFaceFit` (test-only, never
published: it carries recoloured copies of VTE textures).
