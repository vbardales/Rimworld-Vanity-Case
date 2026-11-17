# Vanity Case, French texts and settings page (written 2026-11-17, playTests; owner asked for the in-game check through Pickle).
# Run with -Language French. Map: wsl-deps.lipstick.map. Texts are the keys of Mod/Languages/French/DefInjected/ThingDef/Lipstick.xml.
# Scenario 1 asserts the exact French label and description of each lipstick as the game loaded them.
# Scenario 2 asserts the mod has no Mod options page (settings_audit: not_applicable).
# Scenario 3 captures the info card of one lipstick, to read the item card by eye.
@timeout:1800 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.inspecttabs @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.deffields
Feature: Vanity Case French texts

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused

  Scenario: french-def-text
    Then Nelim's Pickle Tools: def "VanityCase_LipstickCaramel" of type "ThingDef" field "label" is "rouge à lèvres caramel"
    And Nelim's Pickle Tools: def "VanityCase_LipstickCaramel" of type "ThingDef" field "description" is "Un bâton de rouge à lèvres caramel. Porté sur les lèvres, il remplace la couleur peinte des lèvres d'un colon dessiné avec [NL] Facial Animation - WIP (Visage Animé, en travaux)."
    And Nelim's Pickle Tools: def "VanityCase_LipstickRose" of type "ThingDef" field "label" is "rouge à lèvres rose"
    And Nelim's Pickle Tools: def "VanityCase_LipstickRose" of type "ThingDef" field "description" is "Un bâton de rouge à lèvres rose. Porté sur les lèvres, il remplace la couleur peinte des lèvres d'un colon dessiné avec [NL] Facial Animation - WIP (Visage Animé, en travaux)."
    And Nelim's Pickle Tools: def "VanityCase_LipstickBerry" of type "ThingDef" field "label" is "rouge à lèvres couleur baie"
    And Nelim's Pickle Tools: def "VanityCase_LipstickBerry" of type "ThingDef" field "description" is "Un bâton de rouge à lèvres couleur baie foncée. Porté sur les lèvres, il remplace la couleur peinte des lèvres d'un colon dessiné avec [NL] Facial Animation - WIP (Visage Animé, en travaux)."
    And Nelim's Pickle Tools: def "VanityCase_LipstickForest" of type "ThingDef" field "label" is "rouge à lèvres vert forêt"
    And Nelim's Pickle Tools: def "VanityCase_LipstickForest" of type "ThingDef" field "description" is "Un bâton de rouge à lèvres vert forêt, fait pour aller avec une tenue verte. Porté sur les lèvres, il remplace la couleur peinte des lèvres d'un colon dessiné avec [NL] Facial Animation - WIP (Visage Animé, en travaux)."

  Scenario: french-no-settings-page
    Then Nelim's Pickle Tools: the mod options page of the mod "nelim.vanitycase" does not exist

  @review
  Scenario: french-item-card-caramel
    Given Nelim's Pickle Tools: I place the decor "VanityCase_LipstickCaramel" at (112, 200)
    And Nelim's Pickle Tools: I frame the cell (112, 200) at zoom 6
    When Nelim's Pickle Tools: I select the thing of def "VanityCase_LipstickCaramel" at (112, 200)
    And Nelim's Pickle Tools: I open the info card of the selected thing on the "Stats" tab
    And I take a screenshot "lipstick-caramel-card"
    Then Nelim's Pickle Tools: I close the info card
