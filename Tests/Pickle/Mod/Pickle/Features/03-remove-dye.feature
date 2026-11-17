# Vanity Case, taking the lipstick off and dyeing it (written 2026-11-17, playTests 8.g, TESTING row 8).
# Same subject as 01-lipstick: Tester, dark skin (87, 58, 38), MouthLipsBig. Map: wsl-deps.lipstick.map. Colour read by eye on the @review capture.
@timeout:1800 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.coatsteps
Feature: Vanity Case lipstick removed and dyed

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And I set the weather to "Clear"

  @review
  Scenario: lipstick-removed-back-to-red
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
    When Nelim's Pickle Tools: I undress "Tester"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: "Tester" mouth reads "MouthLipsBig"
    And Nelim's Pickle Tools: a portrait of "Tester" is saved as "lipstick-removed-face" at 512 pixels and zoom 3

  @review
  Scenario: lipstick-dyed-berry
    Given I set the hour to 12
    And Nelim's Pickle Tools: a colonist "Tester" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Tester" loses all genes
    And Nelim's Pickle Tools: "Tester" gender is Female
    And Nelim's Pickle Tools: "Tester" skin colour is rgb (87, 58, 38)
    And Nelim's Pickle Tools: "Tester" is undressed
    And Nelim's Pickle Tools: "Tester" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Tester" wears "VanityCase_LipstickCaramel" dyed rgb (128, 32, 64)
    And Nelim's Pickle Tools: "Tester" face is held neutral
    And Nelim's Pickle Tools: "Tester" stands at (112, 200) facing South
    When Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: "Tester" mouth reads "MouthLipsBig"
    And Nelim's Pickle Tools: a portrait of "Tester" is saved as "lipstick-dyed-face" at 512 pixels and zoom 3
