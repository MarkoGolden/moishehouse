Feature: Program Behavior

  Scenario: Program with all required information
    Given I have a program with all required information
    When I attempt to save that program 
    Then the program save should succeed

  Scenario: Program with no date
    Given I have a program missing a date
    When I attempt to save that program
    Then the program save should fail

  Scenario: Program with no description
    Given I have a program missing a description
    When I attempt to save that program
    Then the program save should fail

  Scenario: Program with no name and no image file
    Given I have a program missing a name and has no image
    # Note: Should this be two steps?
    When I attempt to save that program
    Then the program save should fail

  Scenario: Program with date and a name
    Given I have a program with a date and a name
    When I ask for the date and name of that program
    Then the output should be the date and name of that program

  Scenario: Program with no house
    Given I have a program with no house
    When I attempt to save that program
    Then the program save should fail  

  Scenario: Submitted program knows it's status
    Given I have submitted a program
    When I examine that program
    Then the numerical status of the program is one

  Scenario: Approved program knows it's status
    Given I have approved a program
    When I examine that program
    Then the numerical status of the program is two

  Scenario: Declined program knows it's status
    Given I have declined a program
    When I examine that program
    Then the numerical status of the program is three  

  Scenario: Program with no program type
    Given I have a program with no program type
    When I attempt to save that program
    Then the program save should fail

  # Test needed for generated name from file