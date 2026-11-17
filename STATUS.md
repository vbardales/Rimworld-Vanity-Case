---
mod: Vanity Case
packageId: nelim.vanitycase
repo: Rimworld-Vanity-Case
remote: https://github.com/vbardales/Rimworld-Vanity-Case.git
visibility: public             # original creation, nothing taken from another mod (PUBLISHING.md, "Nommage"); the GitHub repository is not created yet
detached: yes
workflow_stage: writeTests[1.0.0]
licence: original
licence_at: "2026-11-06: original work, MIT (LICENSE and Mod/LICENSE). No third-party file: Facial Animation (Nals) is a dependency, Vanilla Textures Expanded - Facial Animation lips are recoloured in memory at run time, never copied (Docs/DESIGN-LIP-COLOURS.md)."
upstream_mod_remotes: N/A      # no source mod: Facial Animation and VTE - Facial Animation are a dependency and an optional input, none of their files is used
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
dependencies: complete         # 2026-11-08, record in remaining (4.g)
workshop_required_items: n/a, not released yet   # owner 2026-11-10 (AUDIT 4.g): prepublication 0.1.0 item only, Required items set by hand at writeReleaseDocs or publish
workshop: none
published: no
tested_on: never
remaining:
  - "2026-11-17: eye fix 41c9a46 seen in game by SaB (ticket 61e3 green, Miel): both eyes equal orange with Caramel worn, Caramel Rose Forest lips clear. Evidence in SanctuaryBacklot/Tests/Pickle/Evidence/miel-lipstick/faces-after-vac-eye-fix.jpg, not a VanityCase ticket."
  - "2026-11-17: localize done (6.g validated by Virginie, round 3 green). Now writeTests[1.0.0]: 7.a scenarios in TESTING.md (lipstick on Miel dark skin, eyes unchanged, no lipstick keeps red, apparel policy), 7.b tests (Tests/Recolour is the harness, name it with its count, no csproj named *.Tests.csproj), 7.d Pickle suite and Tests/Pickle/Inbox, About.xml description to update (work in progress, Interface in English). SaB ticket 61e3 (eyes fix 41c9a46) pending."
  - "2026-11-17: localize: ChatGPT review green (round 3, 0 applied), Translation audit written (6.h). Open 6.g: Virginie French review of the 10 keys (TRANSLATION_REVIEW.md), then translation_fr and localization complete and 6.i to writeTests."
  - "2026-11-17: localize: French DefInjected written (10 keys, Mod/Languages/French), Check-Translations PASS. ChatGPT round 1: English description rewording rejected (taste, current wording natural), PUBLICATION.md absent (writeReleaseDocs), proper nouns Facial Animation and Vanilla Textures Expanded await Virginie and Audit TITLE? answer. Next: /review-translation 1 again (round 2), Translation audit section, Virginie French review, then 6.i."
  - "2026-11-17: REPLAY whole chain (ledger .replays/VanityCase-20261117c.tsv): code[1.0.0] to localize[1.0.0]. 4.g fixed in place (workshop_required_items added). First open 6.a: no text inventory, no Translation audit section, 10 French keys missing (Check-Translations), TRANSLATION_REVIEW.md to make, /review-translation then Virginie review. Also at later stages: Preview.png missing (mountPreview), About.xml description says work in progress and Interface in English (fix at localize and writeReleaseDocs), no unit-test project reason for 7.b (Tests/Recolour is the harness)."
  - "2026-11-17: 4.g REDONE at revision ac000ba (replay). Re-read About.xml and Source/*.cs: hard modDependencies Nals.FacialAnimation (Source/ reflection) and brrainz.harmony (HarmonyLib in VanityCaseMod.cs); VTE VanillaExpanded.VTEXE.FacialAnims only loadAfter, no code reference; DLC none; no LoadFolders, no patch, no MayRequire; Check-OptionalCompat 0/0/0; supportedVersions 1.6. workshop_required_items n/a, not released yet."
  - "2026-11-17: skin-colour fix c8c3c18 seen in game by SaB (their ticket 4ca4 green, Miel dark skin, MouthLipsBig): Berry, Caramel, Rose, Forest distinct, teeth and outline normal. Evidence in SanctuaryBacklot/Tests/Pickle/Evidence/miel-lipstick/faces-after-vac-fix-berry-caramel-rose-forest.jpg, not a VanityCase ticket: our own playTests still to file."
  - "2026-11-17: ecosystem done (2.h, report e600c89, Ecosystem section). Now code[1.0.0] (2.i). Chain 3 to 6 not replayed since: run replay-audit 3..6 next; 3.a to 5 expected done, localize French keys (10) open."
  - "2026-11-17: REPLAY 1.a to 2.i (ledger .replays/VanityCase-20261117.tsv): stage moved back localize[1.0.0] to ecosystem. 2.h open: no docs/inventory/ecosystem-steam/VanityCase.md, no Ecosystem section here (stage added 2026-11-16, mod skipped it). Next: send ECOSYSTEM? to PiI (VanityCase, FA Nals.FacialAnimation, VTE VanillaExpanded.VTEXE.FacialAnims 2816938779), copy summary into an Ecosystem section, then 2.i to code[1.0.0] and replay 3 to 6 (settings not_applicable and Settings audit already written 2026-11-17, localize French keys still missing)."
  - "2026-11-17: settings done (not_applicable, Settings audit section). Now localize[1.0.0]: 10 French keys missing (Check-Translations: 5 lipstick ThingDefs label+description x4, LipSourceDef, ApparelLayerDef), TRANSLATION_REVIEW.md, /review-translation then Virginie review. Uncommitted, not mine: Mod/About/About.xml (modVersion 0.1.0, BOM added) and Mod/About/PublishedFileId.txt (3838120911), prepublication leftovers: ask Virginie before committing. Preview.png missing (mountPreview)."
  - "2026-11-08: 4.g DEPENDENCY RECORD (repo revision 98678ee). Hard (modDependencies in About.xml): Nals.FacialAnimation ([NL] Facial Animation, Workshop 1635901197; Source/ patches its MouthControllerComp.LoadTextures by reflection) and brrainz.harmony (2009463077; Harmony postfix). Optional, no hard dependency: VanillaExpanded.VTEXE.FacialAnims (VTE - Facial Animation, 2816938779), ordered by loadAfter, its lip textures read through LipSourceDef, mod works without it (no source, no recolour). OptionalCompat.xml: none needed (VTE has loadAfter, no patch operation, no MayRequire; Check-OptionalCompat 0 target, 0 declared). DLC: none (dye needs Ideology: open decision, not a dependency yet). incompatibleWith: none known. 4.h next: settings."
  - "2026-11-06: SLEEP HAND-OVER. Session code VaC, parent session NSB (local_9922b4f6-0833-4621-88dd-c02bcbb7e20e, waits to know the lip shades; it already asked for any colour per pawn, outfit match, done as one def per shade). Next moves in order: (1) 4.a to 4.g: write the dependency record in STATUS.md (Facial Animation Nals.FacialAnimation and Harmony brrainz.harmony hard, VTE VanillaExpanded.VTEXE.FacialAnims optional through loadAfter and LipSourceDef, DLC none, date and revision), set dependencies, then 4.h to settings; (2) ask Virginie to file a Pickle ticket (Miel, MouthLipsBig, forest lipstick, capture) at playTests via file-pickle-ticket; never launch RimWorld; (3) open decisions for her: recipe cost (Cloth x1 placeholder), real lipstick icon art (Mod/Textures/VanityCase/Lipstick.png is a programmatic placeholder), final shade list, dye needs Ideology. NsbFaceFit prototype stays test-only in SanctuaryBacklot. Hand-over note: side-session-notes/local_9922b4f6-.../nsb-makeup-setup.md."
  - "2026-11-06: REPLAY (audit-replay): 1.a to 3.d done (1.a search run makeup-dup; 1.b original MIT; 1.c names; 1.d public, no suffix; 1.e repo exists; 1.f git + remote; 1.g docs; 1.h STATUS; 1.i commits; 1.j Check-Status 0; 2.a-2.f sources and derivatives read; 3.a features implemented; 3.b build DLL SAME (sha256 2a7bc7cf); 3.c CHANGELOG). Fix in place: About.xml <url> added. Now at declareDependencies[1.0.0]: 4.a to 4.g open (real dependencies Facial Animation and Harmony hard, VTE optional via loadAfter and the source list; dependency record dated with the revision still to write, dependencies: unchecked), then 4.h. Later stages, not blocking: Preview.png (mountPreview), French (localize), Pickle proof of the lipstick (playTests)."
  - "2026-11-06: makeSources done: Art/ModIcon-source.png (owner, winking smiley with a vanity case) and Art/Preview-source.png (owner, 1672x941, palette 2 families, Vmean 0.597) received and conform; derivatives Mod/About/ModIcon.png (128x128, 21.9 KB) and Art/ModIcon.ico made; PROMPT_VANITYCASE.md deleted. Mod/About/Preview.png is rendered at mountPreview. Next: code[1.0.0] (lipstick defs, recolour, Harmony patch, Docs/DESIGN-LIP-COLOURS.md)."
  - "2026-11-06: 1.c done: name chosen by Virginie: display Vanity Case, folder VanityCase, packageId nelim.vanitycase, repo Rimworld-Vanity-Case (bare name, original creation; Makeup Mod 3810397741 already uses the word Makeup)."
  - "2026-11-06: 1.e, 1.f, 1.i done: public GitHub repository Rimworld-Vanity-Case created (Virginie go), remote origin set, first commit pushed."
  - "2026-11-06: CODE written (lipstick defs, LipRecolour maths with a tested proof in Tests/Recolour on real VTE textures, LipGraphic, Harmony hooks by reflection), build 0 warnings, DLL in Mod/Assemblies; NOT yet seen in game (unverified: the GetSubGraphic hook, mouth refresh on wear and on dye, apparel policy, no worn graphic). Placeholders to replace: Mod/Textures/VanityCase/Lipstick.png is a programmatic stand-in (owner art needed), recipe cost Cloth x1 (decide), no DefInjected French yet (localize stage). Next: a Pickle scenario (Miel with MouthLipsBig wearing forest lipstick, capture), then declareDependencies."
  - "2026-11-06: unverified: lip colours (implemented, 3.a closed), approach in Docs/DESIGN-LIP-COLOURS.md (recolour installed VTE lip textures in memory on demand, Harmony postfix on Facial Animation's MouthControllerComp.LoadTextures, nothing shipped). Virginie: any colour per pawn (example forest green #226E42 to match Miel's underwear, test copy NsbMouthLipsBigForest in NsbFaceFit), ideally per outfit or occasion. Caramel, Rose, Berry are presets only. Virginie 2026-11-06 (final): the lip colour follows the lipstick worn: lipstick = colourable apparel with no worn graphic on its own layer; outfits and occasions go through the apparel policy, matching an outfit is a dye. One lipstick def per shade family (Virginie 2026-11-06), so each occasion's apparel policy picks the shade; first shades Caramel, Rose, Berry, Forest #226E42, list to settle. Open: dye needs Ideology, mouth body part group, recipe and cost."
  - "2026-11-06: 1.a done: duplicate search (Search-Workshop.sh, pattern lipstick or makeup, run makeup-dup): no mod recolours Facial Animation lips. Makeup Mod (BigOlBullseye.MakeupMod, 3810397741) is a craftable beauty item with no visual; Roo's Tattoos and Roo's Birthmarks and Blemishes are skin marks, not lips."
updated: 2026-11-17
protocols_read_sha: 60a2e95e8b1f50ee888a9b04bc0939da4a4c636d
---

# Vanity Case: status

Current state only: the front matter above is the source of truth, run lines go to `Docs/runs/`.
Check it with `scripts/Check-Status.ps1 -Mod VanityCase` (no ERROR).

## State

Repository set up, now at `code[1.0.0]`: About.xml, README, ATTRIBUTION, CHANGELOG, LICENSE, design note. No code.
The test prototype stays in `SanctuaryBacklot/Tests/Pickle/LocalMods/NsbFaceFit` (test-only, never
published: it carries recoloured copies of VTE textures).

## Settings audit

2026-11-17, revision 0a06286 (Source/ 4 .cs, Mod/Defs/Lipstick.xml). Result: `not_applicable`.

Inventory: the mod has no configurable behaviour a player could use. Lip colour comes from the
lipstick worn (one ThingDef per shade, chosen through the apparel policy, dye for custom
colours), so shades are content, not options. The recolour thresholds (`LipRecolour`
constants: reference value, minimum saturation and value, hue window) are fixed maths tuned
on the Vanilla Textures Expanded lip textures, not a player choice: exposing them would only
let a player break the recolour. No hidden-by-default behaviour, no per-save state.
Verified in sources: no MainButtonDef, no ModSettings, no DoSettingsWindowContents, no
GetSettings text (Mod/ and Source/). Check-SettingsContract.ps1 run on this revision.
In-game check (no empty Mod options page, no shortcut) stays `unverified` until playTests.

## Ecosystem

2026-11-17, PiI report `docs/inventory/ecosystem-steam/VanityCase.md` (commit e600c89 of the protocols repository). 20 Steam queries plus a local scan (104 mods name Nals.FacialAnimation or VanillaExpanded.VTEXE.FacialAnims).

- Duplicates, forks, replacements: none. "lipstick" returns 0 results, no mod recolours Facial Animation lips. Closest, different job: Makeup Mod 3810397741 (craftable beauty item, no visual).
- Patches of the parent, Facial Animation 1635901197: 6 (1.7 Compatibility Patch 3821248395, Init Fix 3609895011, Performance Patch 3790129900, Compatibility Project 3585705988, Adjustments for VTE 3532050275, Tattoo Face Scars VTE patch 3832065825). About 80 per-race patches, not listed.
- Retextures to check at playTests: Reel's 3118315633, Facial Animation - Retexture 3271240549, Nice Facial Animation 3302079637, Visual beauty 3685072616, More and Retextured Head Shapes for VTE 3407049972.
- Translations of the parent: none found. Nothing to integrate at localize beyond English and French.
- Verdict: own niche, the mod goes on. No patch or retexture of an original fires on us (no original). Play-test check: lips still show with the retexture packs and with VTE heads.

## Translation audit

2026-11-17, revision 8d33334. English lives in `Mod/Defs/Lipstick.xml` (source text). French lives in `Mod/Languages/French/DefInjected/` (ThingDef 4 labels and 4 descriptions, ApparelLayerDef 1 label, VanityCase.LipSourceDef 1 label): 10 keys, no Keyed (no text in code, 0 Keyed calls).
Inventory: Defs and Source read; no setting, no letter, no message, no text built in code. `Check-Translations.ps1`: PASS, 10 source texts and French injections.
Mod names in French texts: `[NL] Facial Animation - WIP (Visage Animé, en travaux)` (registry form, Audit 2026-11-17); Vanilla Textures Expanded stays English alone in the label (rule of labels), full form `Vanilla Textures Expanded (Extension Vanilla Textures) - [NL] Facial Animation` recorded in `Docs/review-names.md`.
ChatGPT `/review-translation`, page 1: round 1 (1 applied: French delivered; 4 English rewordings rejected as taste), round 2 (1 applied: berry wording), round 3 (0 applied, page green). PUBLICATION.md absent: writeReleaseDocs.
Virginie's French review (6.g): validated by Virginie on 2026-11-17, revision 41c9a46, no correction. `translation_fr` and `localization` complete. In-game checks (raw keys, fallback text, clipping) `unverified` until playTests.
