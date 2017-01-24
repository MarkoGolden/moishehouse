Feature: Grant Behavior

  Scenario: Expired grant
    Given I have a grant that has expired
    When I examine the color of that grant
    Then I should have an expired color

  Scenario: Unexpired grant
    Given I have a grant that has not expired
    When I examine the color of that grant
    Then I should have a current color

  Scenario: Grant with all required information
    Given I have a grant with all required information
    When I attempt to save that grant
    Then the grant save should succeed

  Scenario: Grant with no name
    Given I have a grant missing a name
    When I attempt to save that grant
    Then the grant save should fail
  
  Scenario: Grant with no description
    Given I have a grant missing a description
    When I attempt to save that grant
    Then the grant save should fail
  
  Scenario: Grant with no amount
    Given I have a grant missing an amount
    When I attempt to save that grant
    Then the grant save should fail
  
  Scenario: Grant with no expiration
    Given I have a grant missing an expiration date
    When I attempt to save that grant
    Then the grant save should fail