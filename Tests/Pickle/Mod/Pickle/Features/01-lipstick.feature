# Vanity Case, lipstick (written 2026-11-17, writeTests). One scenario per ticket. Subject: Tester, dark skin (87, 58, 38),
# painted mouth MouthLipsBig (Vanilla Textures Expanded - Facial Animation). The facts the owner and SaB already saw
# on Miel (ticket 4ca4, 61e3 of SanctuaryBacklot) are replayed here on the fixture save, so the mod has its own proof.
# Map: wsl-deps.lipstick.map. The assertion says the mouth def; the colour is read by eye on the @review capture.
@timeout:1800 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.coatsteps
Feature: Vanity Case lipstick

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And I set the weather to "Clear"

  @review
  Scenario: lipstick-none-keeps-red
    Given I set the hour to 12
    And Nelim's Pickle Tools: a colonist "Tester" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Tester" loses all genes
    And Nelim's Pickle Tools: "Tester" gender is Female
    And Nelim's Pickle Tools: "Tester" skin colour is rgb (87, 58, 38)
    And Nelim's Pickle Tools: "Tester" is undressed
    And Nelim's Pickle Tools: "Tester" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Tester" face is held neutral
    And Nelim's Pickle Tools: "Tester" stands at (112, 200) facing South
    And Nelim's Pickle Tools: the game is advanced by 60 ticks
    And Nelim's Pickle Tools: the camera is centered on "Tester" at root size 2
    When Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: "Tester" mouth reads "MouthLipsBig"
    And I take a screenshot "lipstick-none-keeps-red"
    And Nelim's Pickle Tools: a portrait of "Tester" is saved as "lipstick-none-keeps-red-face" at 512 pixels and zoom 3

  @review
  Scenario: lipstick-caramel
    Given I set the hour to 12
    And Nelim's Pickle Tools: a colonist "Tester" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Tester" loses all genes
    And Nelim's Pickle Tools: "Tester" gender is Female
    And Nelim's Pickle Tools: "Tester" skin colour is rgb (87, 58, 38)
    And Nelim's Pickle Tools: "Tester" is undressed
    And Nelim's Pickle Tools: "Tester" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Tester" wears "VanityCase_LipstickCaramel"
    And Nelim's Pickle Tools: "Tester" face is held neutral
    And Nelim's Pickle Tools: "Tester" stands at (112, 200) facing South
    And Nelim's Pickle Tools: the game is advanced by 60 ticks
    And Nelim's Pickle Tools: the camera is centered on "Tester" at root size 2
    When Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: "Tester" mouth reads "MouthLipsBig"
    And I take a screenshot "lipstick-caramel"
    And Nelim's Pickle Tools: a portrait of "Tester" is saved as "lipstick-caramel-face" at 512 pixels and zoom 3

  @review
  Scenario: lipstick-rose
    Given I set the hour to 12
    And Nelim's Pickle Tools: a colonist "Tester" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Tester" loses all genes
    And Nelim's Pickle Tools: "Tester" gender is Female
    And Nelim's Pickle Tools: "Tester" skin colour is rgb (87, 58, 38)
    And Nelim's Pickle Tools: "Tester" is undressed
    And Nelim's Pickle Tools: "Tester" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Tester" wears "VanityCase_LipstickRose"
    And Nelim's Pickle Tools: "Tester" face is held neutral
    And Nelim's Pickle Tools: "Tester" stands at (112, 200) facing South
    And Nelim's Pickle Tools: the game is advanced by 60 ticks
    And Nelim's Pickle Tools: the camera is centered on "Tester" at root size 2
    When Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: "Tester" mouth reads "MouthLipsBig"
    And I take a screenshot "lipstick-rose"
    And Nelim's Pickle Tools: a portrait of "Tester" is saved as "lipstick-rose-face" at 512 pixels and zoom 3

  @review
  Scenario: lipstick-berry
    Given I set the hour to 12
    And Nelim's Pickle Tools: a colonist "Tester" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Tester" loses all genes
    And Nelim's Pickle Tools: "Tester" gender is Female
    And Nelim's Pickle Tools: "Tester" skin colour is rgb (87, 58, 38)
    And Nelim's Pickle Tools: "Tester" is undressed
    And Nelim's Pickle Tools: "Tester" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Tester" wears "VanityCase_LipstickBerry"
    And Nelim's Pickle Tools: "Tester" face is held neutral
    And Nelim's Pickle Tools: "Tester" stands at (112, 200) facing South
    And Nelim's Pickle Tools: the game is advanced by 60 ticks
    And Nelim's Pickle Tools: the camera is centered on "Tester" at root size 2
    When Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: "Tester" mouth reads "MouthLipsBig"
    And I take a screenshot "lipstick-berry"
    And Nelim's Pickle Tools: a portrait of "Tester" is saved as "lipstick-berry-face" at 512 pixels and zoom 3

  @review
  Scenario: lipstick-forest
    Given I set the hour to 12
    And Nelim's Pickle Tools: a colonist "Tester" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Tester" loses all genes
    And Nelim's Pickle Tools: "Tester" gender is Female
    And Nelim's Pickle Tools: "Tester" skin colour is rgb (87, 58, 38)
    And Nelim's Pickle Tools: "Tester" is undressed
    And Nelim's Pickle Tools: "Tester" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Tester" wears "VanityCase_LipstickForest"
    And Nelim's Pickle Tools: "Tester" face is held neutral
    And Nelim's Pickle Tools: "Tester" stands at (112, 200) facing South
    And Nelim's Pickle Tools: the game is advanced by 60 ticks
    And Nelim's Pickle Tools: the camera is centered on "Tester" at root size 2
    When Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: "Tester" mouth reads "MouthLipsBig"
    And I take a screenshot "lipstick-forest"
    And Nelim's Pickle Tools: a portrait of "Tester" is saved as "lipstick-forest-face" at 512 pixels and zoom 3

  @review
  Scenario: lipstick-eyes-unchanged
    Given I set the hour to 12
    And Nelim's Pickle Tools: a colonist "Tester" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Tester" loses all genes
    And Nelim's Pickle Tools: "Tester" gender is Female
    And Nelim's Pickle Tools: "Tester" skin colour is rgb (87, 58, 38)
    And Nelim's Pickle Tools: "Tester" is undressed
    And Nelim's Pickle Tools: "Tester" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Tester" wears "VanityCase_LipstickCaramel"
    And Nelim's Pickle Tools: "Tester" eye colour is rgb (255, 140, 0)
    And Nelim's Pickle Tools: "Tester" face is held neutral
    And Nelim's Pickle Tools: "Tester" stands at (112, 200) facing South
    And Nelim's Pickle Tools: the game is advanced by 60 ticks
    And Nelim's Pickle Tools: the camera is centered on "Tester" at root size 2
    When Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: "Tester" mouth reads "MouthLipsBig"
    And I take a screenshot "lipstick-eyes-unchanged"
    And Nelim's Pickle Tools: a portrait of "Tester" is saved as "lipstick-eyes-unchanged-face" at 512 pixels and zoom 3
