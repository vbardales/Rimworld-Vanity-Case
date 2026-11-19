# Vanity Case, base recipe of the four lipsticks (written 2026-11-20, playTests 8.f, TESTING row 10).
# Map: wsl-deps.lipstick.map (no optional mod loaded). The base cost is cloth and one berry, no other mod needed.
# costList item text is the ThingDefCountClass ToString, written "(1x Def)" from memory (NOT verified): if the first run fails on the text, read the failure, it lists what the list holds.
@timeout:1800 @requires:nelim.pickletools.deffields
Feature: Vanity Case base recipe

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused

  Scenario: recipe-base-berry
    Then Nelim's Pickle Tools: the def "VanityCase_LipstickCaramel" of type "ThingDef" has "(1x RawBerries)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickRose" of type "ThingDef" has "(1x RawBerries)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickBerry" of type "ThingDef" has "(1x RawBerries)" in the list "costList"
    And Nelim's Pickle Tools: the def "VanityCase_LipstickForest" of type "ThingDef" has "(1x RawBerries)" in the list "costList"
