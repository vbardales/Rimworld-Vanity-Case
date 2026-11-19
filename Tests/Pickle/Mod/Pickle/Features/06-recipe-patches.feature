# Vanity Case, optional recipe patches (written 2026-11-20, playTests 8.f, TESTING row 11).
# Map: wsl-deps.recipepatches.map = lipstick map + Apothecary (Continued) + EM Tattoos and Piercings (Continued).
# Patch file: Mod/Patches/LipstickIngredients.xml, two PatchOperationFindMod by mod name. Declared in Mod/About/OptionalCompat.xml.
# UNVERIFIED before the first run: that the game matches the names 'Apothecary (Continued)' and 'EM Tattoos and Piercings (Continued)', the costList text format, and the dependencies the two Workshop mods need in the map.
@timeout:1800 @requires:nelim.pickletools.deffields
Feature: Vanity Case recipe patches

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused

  Scenario: recipe-apothecary-tallow
    Then Nelim's Pickle Tools: the def "VanityCase_LipstickCaramel" of type "ThingDef" has "(1x AYTallow)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickRose" of type "ThingDef" has "(1x AYTallow)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickBerry" of type "ThingDef" has "(1x AYTallow)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickForest" of type "ThingDef" has "(1x AYTallow)" in the list "costList"

  Scenario: recipe-em-pigments
    Then Nelim's Pickle Tools: the def "VanityCase_LipstickCaramel" of type "ThingDef" has "(1x EMPigmentOrange)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickRose" of type "ThingDef" has "(1x EMPigmentRed)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickBerry" of type "ThingDef" has "(1x EMPigmentPurple)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickForest" of type "ThingDef" has "(1x EMPigmentGreen)" in the list "costList"
