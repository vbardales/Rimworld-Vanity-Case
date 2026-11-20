@requires:nelim.sanctuarybacklot
@requires:nelim.pickletools.screenshotstudio
@requires:nelim.pickletools.camerazoom
@requires:nelim.pickletools.colonistrace
@requires:nelim.pickletools.stagedecor
@requires:nelim.pickletools.inspecttabs
@requires:nelim.pickletools.clickdiagnostics
@timeout:1500
# Calibration, not a gallery set: four shots of the same pawn (Nelim, Berry lipstick) with the mouth step lowered by 0.05, 0.12, 0.2 and 0.3 cell, root size 0.5. A person opens the four images and reads which drop centres the lips; the value goes into scenes 2, 3 and 5 of vanitycase-gallery.feature (PiT, 2026-11-18: 0.12 is a guess).
Feature: Vanity Case mouth calibration

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And I set the weather to "Clear"

  @review
  Scenario: vanity-mouth-drop-005
    Given I set the hour to 10
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "terrace"
    And Nelim's Sanctuary: I am at the sanctuary "terrace"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" face tattoo is "Face_Love"
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" face skin is "SkinNormal"
    And Nelim's Pickle Tools: "Nelim" is undressed
    And Nelim's Pickle Tools: "Nelim" wears "LTS_Tunika" made of "Cloth"
    And Nelim's Pickle Tools: the "LTS_Tunika" worn by "Nelim" is dyed rgb (31, 122, 92)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_PAESmallEarrings" made of "Gold"
    And Nelim's Pickle Tools: "Nelim" also wears "VanityCase_LipstickBerry"
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmirk"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" eyeballs are "Swift"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And Nelim's Pickle Tools: the area from (193, 118) to (200, 124) is emptied
    And Nelim's Pickle Tools: "Nelim" stands at (196, 123) facing South
    And Nelim's Pickle Tools: the camera frames the mouth of "Nelim" at root size 0.5 lowered by 0.05 cells
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "vanity-mouth-drop-005"

  @review
  Scenario: vanity-mouth-drop-012
    Given I set the hour to 10
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "terrace"
    And Nelim's Sanctuary: I am at the sanctuary "terrace"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" face tattoo is "Face_Love"
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" face skin is "SkinNormal"
    And Nelim's Pickle Tools: "Nelim" is undressed
    And Nelim's Pickle Tools: "Nelim" wears "LTS_Tunika" made of "Cloth"
    And Nelim's Pickle Tools: the "LTS_Tunika" worn by "Nelim" is dyed rgb (31, 122, 92)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_PAESmallEarrings" made of "Gold"
    And Nelim's Pickle Tools: "Nelim" also wears "VanityCase_LipstickBerry"
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmirk"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" eyeballs are "Swift"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And Nelim's Pickle Tools: the area from (193, 118) to (200, 124) is emptied
    And Nelim's Pickle Tools: "Nelim" stands at (196, 123) facing South
    And Nelim's Pickle Tools: the camera frames the mouth of "Nelim" at root size 0.5 lowered by 0.12 cells
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "vanity-mouth-drop-012"

  @review
  Scenario: vanity-mouth-drop-02
    Given I set the hour to 10
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "terrace"
    And Nelim's Sanctuary: I am at the sanctuary "terrace"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" face tattoo is "Face_Love"
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" face skin is "SkinNormal"
    And Nelim's Pickle Tools: "Nelim" is undressed
    And Nelim's Pickle Tools: "Nelim" wears "LTS_Tunika" made of "Cloth"
    And Nelim's Pickle Tools: the "LTS_Tunika" worn by "Nelim" is dyed rgb (31, 122, 92)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_PAESmallEarrings" made of "Gold"
    And Nelim's Pickle Tools: "Nelim" also wears "VanityCase_LipstickBerry"
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmirk"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" eyeballs are "Swift"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And Nelim's Pickle Tools: the area from (193, 118) to (200, 124) is emptied
    And Nelim's Pickle Tools: "Nelim" stands at (196, 123) facing South
    And Nelim's Pickle Tools: the camera frames the mouth of "Nelim" at root size 0.5 lowered by 0.2 cells
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "vanity-mouth-drop-02"

  @review
  Scenario: vanity-mouth-drop-03
    Given I set the hour to 10
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "terrace"
    And Nelim's Sanctuary: I am at the sanctuary "terrace"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" face tattoo is "Face_Love"
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" face skin is "SkinNormal"
    And Nelim's Pickle Tools: "Nelim" is undressed
    And Nelim's Pickle Tools: "Nelim" wears "LTS_Tunika" made of "Cloth"
    And Nelim's Pickle Tools: the "LTS_Tunika" worn by "Nelim" is dyed rgb (31, 122, 92)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_PAESmallEarrings" made of "Gold"
    And Nelim's Pickle Tools: "Nelim" also wears "VanityCase_LipstickBerry"
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmirk"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" eyeballs are "Swift"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And Nelim's Pickle Tools: the area from (193, 118) to (200, 124) is emptied
    And Nelim's Pickle Tools: "Nelim" stands at (196, 123) facing South
    And Nelim's Pickle Tools: the camera frames the mouth of "Nelim" at root size 0.5 lowered by 0.3 cells
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "vanity-mouth-drop-03"
