---
mod: Vanity Case
packageId: nelim.vanitycase
repo: Rimworld-Vanity-Case
remote: https://github.com/vbardales/Rimworld-Vanity-Case.git
visibility: public             # original creation, nothing taken from another mod (PUBLISHING.md, "Nommage"); the GitHub repository is not created yet
detached: yes
workflow_stage: shootGallery[1.0.0]
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
tested_on: 2026-11-17 pickle 8064cbb (1.6)
tested_1_7: no
code_review_sha: 6e27ca89118781c8168d9923f64c58d4e98d0b6b
remaining:
  - "2026-11-18: CALIBRATION DONE (ticket b14e, 4/4 green, images read): lips sit about 0.44 cell below the head position (0.05: bottom edge, 0.12: low, 0.2: 73 %, 0.3: 63 % of the frame at root size 0.5). Scenes 2, 3, 5 rewritten as face and shoulders with `the camera frames the mouth of X at root size 1 lowered by 0.24 cells` (lips about 70 px wide at 1920, about 10 px at 268 px); scene 6 now `frames the head of Miel and Nelim at root size 1.2`, Rose tube moved to (141, 72) south of Miel. Open risk: decoration at that zoom (props only at the edges), Miel head type may shift the lips. Next: gallery ticket for scenes 2 to 6, score, REDO loop."
  - "2026-11-18: SCORED set 2 (ticket f17f, 5/5 green): scene 6 candidate (Art/Gallery-clean/6-tea.jpg); scenes 2, 3, 5 REDO for decoration (bare brick wall or bare wood in the close frame), scene 4 REDO for j (wide frame, lips invisible). Recomposed: scenes 2, 3, 5 mouth step at root size 1.2 with lantern, daylily and grass inside the frame, scene 4 head step on both at root size 1.3. Candidates: 1, 6, 7. Next: gallery ticket scenes 2 to 5, score, then ask Virginie for /mod-workflow:rate-gallery once all are candidates."
  - "2026-11-18: SCORE-GALLERY on ticket 20261118-131902 (gallery set 5/5 green on 0e2b62c, evidence Tests/Pickle/Inbox/gallery-1-3-v5, captures opened, 268 px montage checked). Scene 1 candidate (tubes readable at 268 px, lips not; lower third of the floor bare, decoration about 4). Scene 7 item card not scored, window readable. REDO: scene 2 (frame is a medium shot, not the planned tight head and shoulders; Caramel lips unreadable at 268 px: j weak), scene 3 (Miel back to camera, only her hair shows; Berry lips unreadable at 268 px), scene 6 (the Rose tube at (141, 74) sits north of Miel and reads as growing from her head; hut dark; lips unreadable). Captures of 2, 3 and 6 deleted. Scenes 4 and 5: no capture yet, plan only (4.5 and 4.0, j weak assumed). Lead, not verified: the 'camera frames the head ... at root size 2.4 / 2.6' step seems clamped at the game's closest zoom (frames of 2.4 to 3.2 look alike), so the lips stay small: ask NPT for a closer head or lips zoom (or crop the 1920x1080 capture on the faces); put the tube south of Miel in 6 (z 72, not 74). Queue paused by Virginie: scenario rewrite and refile after the unpause."
  - "2026-11-18: recipe of the 4 lipsticks changed (owner ok, shootGallery): base Cloth 1 + RawBerries 1 (no dependency); Mod/Patches/LipstickIngredients.xml adds AYTallow 1 with Apothecary (Continued) and swaps the berry for EMPigment* (Caramel orange, Rose red, Berry purple, Forest green) with EM Tattoos and Piercings, both by PatchOperationFindMod. NOT played: the base recipe loads in the gallery tickets, the patches need a ticket with those two mods (record them in 4.g, About.xml unchanged, no hard dependency)."
  - "2026-11-17: PiI answered (tattoo and makeup recombination, 4861 installed folders, 14 Steam searches): only Multi-Layered Tattoos 3656122803 recombines (runtime composition, order, bake, 1.6 and 1.7; Harmony approach unread, needs a subscribe by PiI). Tattoo Face Scars 3792233113 (LuxSolace) ships per-face texture sets via LoadFolders IfModActive (NL FA, Nice FA, UNAGI, ODZ) and notes a Nice FA nose over the scars. Roo Starter Pack 2555588467 and Misc Tattoos 2564009013 have Face_Lipstick, Face_Blush, Face_EyeShadow as plain TattooDefs, one per slot. Makeup Mod 3810397741 is a Beauty item only. No mod recolours another mod textures at runtime like our lipstick: read the installed texPath, ship none is the licence-safe pattern. For 1.1.0: one ApparelLayerDef per zone, optional read of the Tattoo Mixer code via PiI subscribe."
  - "2026-11-17: Virginie pointed at Multi-Layered Tattoos (Workshop 3656122803, Tattoo Mixer): one tattoo slot per pawn, the mod lets several tattoos stack by composing them into one baked TattooDef (bake) with a layer order, presets, a gizmo, and a per-pawn cap (15 default, 50 max) for stability. Same constraint as our makeup family (one worn item per layer): reference for the 1.1.0 design (separate layer per zone, or a baked composite). Not yet read beyond the page; PiI search still pending."
  - "2026-11-17: Virginie decided 1.0.0 ships the lipstick only; the makeup family (one ApparelLayerDef per zone: lips already, eyelids, cheeks, grouped under the name maquillage) is redone after, from 1.1.0. Waiting on PiI for the tattoo and face-paint recombination mods that met the same layer problem (technique to copy). Candidates for 1.0.1 or 1.1.0: 8.m low findings, VteLips label full name, 1.7 colour fix."
  - "2026-11-17: 4.g REDONE at revision ac000ba (replay). Re-read About.xml and Source/*.cs: hard modDependencies Nals.FacialAnimation (Source/ reflection) and brrainz.harmony (HarmonyLib in VanityCaseMod.cs); VTE VanillaExpanded.VTEXE.FacialAnims only loadAfter, no code reference; DLC none; no LoadFolders, no patch, no MayRequire; Check-OptionalCompat 0/0/0; supportedVersions 1.6. workshop_required_items n/a, not released yet."
  - "2026-11-08: 4.g DEPENDENCY RECORD (repo revision 98678ee). Hard (modDependencies in About.xml): Nals.FacialAnimation ([NL] Facial Animation, Workshop 1635901197; Source/ patches its MouthControllerComp.LoadTextures by reflection) and brrainz.harmony (2009463077; Harmony postfix). Optional, no hard dependency: VanillaExpanded.VTEXE.FacialAnims (VTE - Facial Animation, 2816938779), ordered by loadAfter, its lip textures read through LipSourceDef, mod works without it (no source, no recolour). OptionalCompat.xml: none needed (VTE has loadAfter, no patch operation, no MayRequire; Check-OptionalCompat 0 target, 0 declared). DLC: none (dye needs Ideology: open decision, not a dependency yet). incompatibleWith: none known. 4.h next: settings."
  - "2026-11-17: shotlist 1.0.0 written (plan mean 4.25, drift check OK), stage shootGallery[1.0.0]. Gallery tickets filed on b1c4838+map fix: scenes 1-3 (8e4b), 4-6 (8bc5), 7 item card (eaa3); evidence Tests/Pickle/Inbox/gallery-*. Then score-gallery on captures, REDO loop, subtitles, one review for Virginie."
  - "2026-11-17: playTests closed (8.a to 8.n). Ticket abae green on 8064cbb: 2/2 (lipstick-removed-back-to-red: original dark red lips return after undress; lipstick-dyed-berry: Caramel dyed rgb 128,32,64 draws a berry shade), captures read. TESTING rows 7 (hard dependency, n/a) and 8 (apparel policy n/a, game logic) settled. Evidence Tests/Pickle/Evidence/remove-dye. 1.7 still tested_1_7 no (colour not applied, cause open). 8.m lows consigned for 1.0.1. Next writeShotlist[1.0.0]: shotlist of the Steam gallery, then shootGallery, mountPreview (Preview.png), writeReleaseDocs."
  - "2026-11-17: proper noun Textures Expanded (short form, internal label only): Virginie 2026-11-17, kept as is, recorded in Docs/review-names.md. playTests: nothing open for her."
  - "2026-11-17: playTests French and settings ticket 9da4 green on ea5abb6: 3/3 (02-french: french-def-text exact label and description of the 4 lipsticks, french-no-settings-page nelim.vanitycase has no Mod options page, french-item-card-caramel). Capture read: card title Rouge à lèvres caramel, description exact, layer Lèvres, source Vanity Case, nothing English left. Player.log: only the Pickle-tests companion warnings (downloadUrl, no content), none from Vanity Case. Evidence Tests/Pickle/Evidence/french-review (git-ignored). Open at playTests: Virginie validation of the card capture (optional), Preview.png absent (mountPreview), 1.7, TESTING rows 7 and 8 (dye, policy) unverified."
  - "2026-11-17: 8.m sha moved to HEAD after reading git diff da6a007..HEAD -- Mod: revue du diff : images et texte seuls (About.xml description sentences only)."
  - "2026-11-17: /review-translation page 1 answered again (round recorded, 0 applied). Rejected: (a) VteLips.label English and French to the full VTE - [NL] Facial Animation name: correct but the LipSourceDef label is never shown to players and a Mod/ edit reopens 8.m for nothing, candidate for 1.0.1 with the 8.m low findings; (b) French description dessiné to représenté: taste. Open for Virginie: the short form Textures Expanded (only in that label, already covered by the full name in Docs/review-names.md). No french_review_pending line in STATUS.md."
  - "2026-11-17: 8.m code review done (Opus sub-agent, whole history, no tag), 0 blocking defect, 8 low, none fixed (a Source/ change would reopen playTests and need a new Pickle ticket). Consigned: (a) VanityCaseMod.cs:91 postfix ignores rotDrawMode and invisibility, lips stay recoloured on rotting, invisible pawns and skull (fix: add RotDrawMode parameter, only Fresh and not psychologically invisible); (b) :102 dummy graphic wrapped in LipGraphic defeats FA dummy check (harmless if dummy.png transparent; fix: skip path Things/Common/dummy); (c) LipGraphic.cs:44 materials leak if rotation 1 to 3 fails; (d) LipGraphic.cs:13-14 caches unbounded, accepted; (e) :58 Notify_ColorChanged patched on Thing and Apparel, possible double Refresh, harmless; (f) Tests/Recolour real-texture pass runs the 3-argument Apply only. About.xml text fixed (work in progress and Interface in English removed). 1.7 path not reviewed (decompile failed). Candidates for a 1.0.1 or the 1.7 fix."
  - "2026-11-17: 1.7 pass done: tested_1_7 no (Docs/runs/2026-11-17-1.7.md). cd30 6/6 green but portraits show the lipstick colour NOT applied on 1.7 (same dark red as no lipstick); 1.6 fine (80f3). Cause open: FA 1.7 build or Harmony postfix. Next: 1.7 ticket with Player.log, or 1.7 fix; supportedVersions stays 1.6. Other playTests items open: French by eye, settings no-page check, 8.m code review."
  - "2026-11-17: CI/CD skeleton received and checked (.github/publish.config.json: item 3838120911, nelim.vanitycase, requirePaths dll Defs Languages, preview About/Preview.png, gallery Art/Gallery, build Source/VanityCase.csproj; junction RimWorld/Mods/VanityCase mounted per CI/CD). Tests/Test-Mod.ps1 run at 741c171+: 4 passed, 1 failed (Check-ModBasics: Preview.png missing, expected until mountPreview), DefRefs, Textures, PatchTargets, ConfigErrors ok. No Tests/Rule-*.ps1: own values are covered by Tests/Recolour.Tests.csproj and the defs by the shared checks. publish dry-run waits PUBLICATION.md and CHANGELOG [1.0.0] (writeReleaseDocs)."
  - "2026-11-17: eye fix 41c9a46 seen in game by SaB (ticket 61e3 green, Miel): both eyes equal orange with Caramel worn, Caramel Rose Forest lips clear. Evidence in SanctuaryBacklot/Tests/Pickle/Evidence/miel-lipstick/faces-after-vac-eye-fix.jpg, not a VanityCase ticket."
  - "2026-11-17: skin-colour fix c8c3c18 seen in game by SaB (their ticket 4ca4 green, Miel dark skin, MouthLipsBig): Berry, Caramel, Rose, Forest distinct, teeth and outline normal. Evidence in SanctuaryBacklot/Tests/Pickle/Evidence/miel-lipstick/faces-after-vac-fix-berry-caramel-rose-forest.jpg, not a VanityCase ticket: our own playTests still to file."
  - "2026-11-06: REPLAY (audit-replay): 1.a to 3.d done (1.a search run makeup-dup; 1.b original MIT; 1.c names; 1.d public, no suffix; 1.e repo exists; 1.f git + remote; 1.g docs; 1.h STATUS; 1.i commits; 1.j Check-Status 0; 2.a-2.f sources and derivatives read; 3.a features implemented; 3.b build DLL SAME (sha256 2a7bc7cf); 3.c CHANGELOG). Fix in place: About.xml <url> added. Now at declareDependencies[1.0.0]: 4.a to 4.g open (real dependencies Facial Animation and Harmony hard, VTE optional via loadAfter and the source list; dependency record dated with the revision still to write, dependencies: unchecked), then 4.h. Later stages, not blocking: Preview.png (mountPreview), French (localize), Pickle proof of the lipstick (playTests)."
  - "2026-11-06: makeSources done: Art/ModIcon-source.png (owner, winking smiley with a vanity case) and Art/Preview-source.png (owner, 1672x941, palette 2 families, Vmean 0.597) received and conform; derivatives Mod/About/ModIcon.png (128x128, 21.9 KB) and Art/ModIcon.ico made; PROMPT_VANITYCASE.md deleted. Mod/About/Preview.png is rendered at mountPreview. Next: code[1.0.0] (lipstick defs, recolour, Harmony patch, Docs/DESIGN-LIP-COLOURS.md)."
  - "2026-11-06: 1.c done: name chosen by Virginie: display Vanity Case, folder VanityCase, packageId nelim.vanitycase, repo Rimworld-Vanity-Case (bare name, original creation; Makeup Mod 3810397741 already uses the word Makeup)."
  - "2026-11-06: 1.e, 1.f, 1.i done: public GitHub repository Rimworld-Vanity-Case created (Virginie go), remote origin set, first commit pushed."
  - "2026-11-06: CODE written (lipstick defs, LipRecolour maths with a tested proof in Tests/Recolour on real VTE textures, LipGraphic, Harmony hooks by reflection), build 0 warnings, DLL in Mod/Assemblies; NOT yet seen in game (unverified: the GetSubGraphic hook, mouth refresh on wear and on dye, apparel policy, no worn graphic). Placeholders to replace: Mod/Textures/VanityCase/Lipstick.png is a programmatic stand-in (owner art needed), recipe cost Cloth x1 (decide), no DefInjected French yet (localize stage). Next: a Pickle scenario (Miel with MouthLipsBig wearing forest lipstick, capture), then declareDependencies."
  - "2026-11-06: unverified: lip colours (implemented, 3.a closed), approach in Docs/DESIGN-LIP-COLOURS.md (recolour installed VTE lip textures in memory on demand, Harmony postfix on Facial Animation's MouthControllerComp.LoadTextures, nothing shipped). Virginie: any colour per pawn (example forest green #226E42 to match Miel's underwear, test copy NsbMouthLipsBigForest in NsbFaceFit), ideally per outfit or occasion. Caramel, Rose, Berry are presets only. Virginie 2026-11-06 (final): the lip colour follows the lipstick worn: lipstick = colourable apparel with no worn graphic on its own layer; outfits and occasions go through the apparel policy, matching an outfit is a dye. One lipstick def per shade family (Virginie 2026-11-06), so each occasion's apparel policy picks the shade; first shades Caramel, Rose, Berry, Forest #226E42, list to settle. Open: dye needs Ideology, mouth body part group, recipe and cost."
  - "2026-11-06: 1.a done: duplicate search (Search-Workshop.sh, pattern lipstick or makeup, run makeup-dup): no mod recolours Facial Animation lips. Makeup Mod (BigOlBullseye.MakeupMod, 3810397741) is a craftable beauty item with no visual; Roo's Tattoos and Roo's Birthmarks and Blemishes are skin marks, not lips."
updated: 2026-11-17
protocols_read_sha: 4e04111c56302a98a34aad7f6b196ff671223e04
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
- Layered tattoo and face-paint mods, added 2026-11-18 at Virginie's request (PiI answer of 2026-11-17, 4861 installed folders, 14 Steam searches): Multi-Layered Tattoos 3656122803 (Tattoo Mixer) is the one that recombines: one tattoo slot per pawn, several tattoos stack by being composed into one baked TattooDef with a layer order, presets, a gizmo and a per-pawn cap (15 default, 50 max); runtime composition, 1.6 and 1.7; technique to study for the 1.1.0 makeup layers (Harmony approach unread, needs a subscribe by PiI). Related, not recombining: Tattoo Face Scars 3792233113 (per-face texture sets via LoadFolders IfModActive), Roo Starter Pack 2555588467 and Misc Tattoos 2564009013 (Face_Lipstick, Face_Blush, Face_EyeShadow as plain TattooDefs, one per slot), Makeup Mod 3810397741 (Beauty item). Not duplicates: the lipstick recolours Facial Animation lips, these are tattoo layers.
- Refresh 2026-11-17 (playTests 8.0, PiI report 4e59b10): no new lipstick or lip-colour duplicate ("lipstick" only returns Over The Rainbow and Pig Wife by text), no new mouth or lip patch, retexture or translation. Two new Facial Animation items added as linked, not lips: RC - Facial animation 3840159863, Mass Effect Xenotypes - Facial Animation 3639216820. Makeup Mod 3810397741 unchanged. Verdict unchanged.

## Translation audit

2026-11-17, revision 8d33334. English lives in `Mod/Defs/Lipstick.xml` (source text). French lives in `Mod/Languages/French/DefInjected/` (ThingDef 4 labels and 4 descriptions, ApparelLayerDef 1 label, VanityCase.LipSourceDef 1 label): 10 keys, no Keyed (no text in code, 0 Keyed calls).
Inventory: Defs and Source read; no setting, no letter, no message, no text built in code. `Check-Translations.ps1`: PASS, 10 source texts and French injections.
Mod names in French texts: `[NL] Facial Animation - WIP (Visage Animé, en travaux)` (registry form, Audit 2026-11-17); Vanilla Textures Expanded stays English alone in the label (rule of labels), full form `Vanilla Textures Expanded (Extension Vanilla Textures) - [NL] Facial Animation` recorded in `Docs/review-names.md`.
ChatGPT `/review-translation`, page 1: round 1 (1 applied: French delivered; 4 English rewordings rejected as taste), round 2 (1 applied: berry wording), round 3 (0 applied, page green). PUBLICATION.md absent: writeReleaseDocs.
Virginie's French review (6.g): validated by Virginie on 2026-11-17, revision 41c9a46, no correction. `translation_fr` and `localization` complete. In-game checks (raw keys, fallback text, clipping) `unverified` until playTests.

## NSB

Synced 2026-11-17 (sync-nsb-npt, NSB docs read by a read-only sub-agent, NPT steps read). Rules said back: everything in NSB is free; a colonist or domestic animal outside NSB, and any change to a colonist property (mouth included), need Virginie's express validation; every outfit is free; every animal the mod includes must be shown (the mod includes none). Nothing in NSB moved since the lipstick tests: Miel's lipstick Caramel was set by the owner on 2026-11-17 (VALIDE.md). Shotlist written 2026-11-17 (see "Shotlist"): Nelim and Miel only, no colonist outside NSB, no property changed (Nelim keeps her canon MouthLipsSmirk). NPT: no new step or catalogue entry changes the plan (mouth, portrait and dyed-wear steps already used).

Places read: 2026-11-17 Tribe read: 2026-11-17 Steps read: 2026-11-18

| Place | Shots | Changes for the gallery | Last read |
| --- | --- | --- | --- |
| Veranda `terrace` (196, 121 portrait cell, zoom 6.8) | candidate, face close-ups | none; hour 12, weather Clear set by the scenario | 2026-11-17 |
| Cloister `cloister` (178, 128), Tea room `hut` (141, 72) | candidates, group or mood shot | none | 2026-11-17 |

| Colonist | Shots | Outfit per shot | Last read | Exceptions |
| --- | --- | --- | --- | --- |
| Miel (dark skin, `MouthLipsBig` fixed by roster) | candidate lead: four shades Caramel, Rose, Berry, Forest | orange `VAE_Apparel_Overalls` + cream bandeau for Caramel; green daily (plaid shirt + green trousers, or sage jacket) for Forest; any validated daily for Rose and Berry | 2026-11-17 | none: mouth already hers, Caramel validated by Virginie 2026-11-17 |
| Nelim (`MouthLipsSmirk`, supported by the mod, roster value is a proposition) | candidate | emerald `LTS_Tunika` for Forest, blood-red `LTS_SummerSundress` for Berry | 2026-11-17 | PENDING if her mouth must change; not needed if her roster mouth stays |

Animals: none (the mod adds no animal and no item addresses one). Included animals: none, nothing MISSING.

## Shotlist

Written 2026-11-17 in the header of `Tests/Pickle/Mod/Pickle/Features/vanitycase-gallery.feature` (pass map `Tests/Pickle/wsl-deps.gallery.map`). Story "Four shades, one day": Nelim helps Miel pick a lipstick for tea at the hut; hours 8, 9, 10, 14, 18, 19, clear. Opus director pass kept: tighter zoom, tube counter 4-3-2-1, no mirror, Berry on Nelim, no red-on-red, hut at 18h and 19h, no walking pose. Not kept: Rose on Miel (Caramel is her validated lipstick). `Check-ShotlistVsScenario`: OK (2026-11-17). No capture yet: plan rated.

| # | scene | a place, hour | b decor | c living | d pawns | e instant | f frame | g says | j at 268 px | plan |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | vanity-1-dressing-corner | terrace, 8h, Clear | 4 tubes, Stool, TorchLamp lit, PlantPot, SculptureSmall | Plant_Daylily, YellowTallGrass | Nelim emerald LTS_Tunika, Highpony, smirk; Miel overalls, bare lips | she holds out the first tube (e weak: standing pose) | zoom 3.2, tubes foreground | Four shades, one morning | weak (small lips, assumed) | 4.0 |
| 2 | vanity-2-caramel | terrace, 9h | 3 tubes, Stool, torch, pot | daylily | Miel Caramel, smile | just put the colour on (e weak) | zoom 2.6 head and shoulders | Miel tries Caramel | ok | 4.5 |
| 3 | vanity-3-berry | terrace, 10h | 2 tubes, Stool, pot, grass | daylily, grass | Nelim Berry, Miel shoulder | glances at Miel (e weak) | zoom 2.4 off-centre | Berry suits Nelim | ok | 4.5 |
| 4 | vanity-4-cloister | cloister, 14h | torii, wall lanterns, TorchLamp lit, pot | daylily, grass | both, Berry and Caramel | set out for tea (e weak) | zoom 3 | Two shades on the way to tea | weak (two faces, assumed) | 4.0 |
| 5 | vanity-5-forest | hut, 18h | andon, DR_StickLantern lit, Stool, pot | daylily, grass | Miel Forest, cream wrap, green trousers | just changed for tea (e weak) | zoom 2.4 | Miel chooses Forest | ok | 4.5 |
| 6 | vanity-6-tea | hut, 19h | andon, 2 DR_StickLantern lit, Rose tube, pot | daylily | both, Forest and Berry | tea poured (e weak) | zoom 5 wide closing | Four shades, three chosen | weak (wide, assumed) | 4.0 |
| 7 | vanity-7-item-card | window-backdrop-for-height, 12h | item | | | | zoom 6 | interface window, not scored | | - |

k series: ok (one story, wide 6 / medium 1, 4 / tight 2, 3, 5, opening 1, closing 6). e weak on every scene is assumed: no step gives a pawn a job or a walking pose, the instant is written but the pose is standing. Plan mean 4.25. Risks: lips unreadable at 268 px on 1, 4, 6 (test with ffmpeg at the first capture); cells read from empty-place photos at the first ticket; `Miel` and `Nelim` smile kit overrides the mouth if the order changes; green lips vs the hut wall.
