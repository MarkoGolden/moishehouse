Feature: House Behavior

  Scenario: New house with all required information
    Given I have a house with all required information
    When I attempt to save that house
    Then the house save should succeed

  Scenario: New house without city
    Given I have a house without a city
    When I attempt to save that house
    Then the house save should fail

  Scenario: New house without state
    Given I have a house without a state
    When I attempt to save that house
    Then the house save should fail

  Scenario: House knows it's one month range
    Given I have an existing house
    When I request the one month range
    Then the last day of this month should be the end date

  Scenario: House knows it's two month range
    Given I have an existing house
    When I request the two month range
    Then the last day of two months prior should be the end date

  Scenario: House knows it's next month range
    Given I have an existing house
    When I request the next month range
    Then the first day of next month should be the end date

  Scenario: House knows it's previous month range
    Given I have an existing house
    When I request the previous month range
    Then the first day of this month should be the end date
