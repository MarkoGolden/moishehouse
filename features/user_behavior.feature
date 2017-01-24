Feature: User Behavior

  Scenario: New user with all required information
    Given I have a user with all required information
    When I attempt to save that user
    Then the user save should succeed

  Scenario: New user has sign in count set to zero
    Given I have a user all required information except a sign in count
    When I attempt to save that user
    Then the user save should succeed
    And the sign in count should be zero

  Scenario: New user with no email
    Given I have a user missing an email
    When I attempt to save that user
    Then the user save should fail
  
  Scenario: New user with malformed email
    Given I have a user with a malformed email
    When I attempt to save that user
    Then the user save should fail

  Scenario: New user with no password
    Given I have a user missing a password
    When I attempt to save that user
    Then the user save should fail

  Scenario: New user with short password
    Given I have a user with a five character password
    When I attempt to save that user
    Then the user save should fail

  Scenario: New user with no first name
   Given I have a user missing a first name
    When I attempt to save that user
    Then the user save should fail

  Scenario: New user with no last name
   Given I have a user missing a last name
    When I attempt to save that user
    Then the user save should fail

  Scenario: New user with no role
   Given I have a user missing a role
    When I attempt to save that user
    Then the user save should fail

  Scenario: User has her name capitalized
    Given I have a user who did not capitalize her name
    When I request the first and last name of that user
    Then the both the first and last name should be capitalized

  Scenario: User has his email in lower case
    Given I have a user who capitalized his email
    When I request the email that user
    Then the email should be in lower case

  Scenario: User knows it's full name
    Given I have an existing user
    When I request the full name of that user
    Then the name should be formatted with last name first

  Scenario: User knows it's first and last name
    Given I have an existing user
    When I request the first and last name of that user
    Then the name should be formatted with first name followed by last name 

  Scenario: User with no specified image
    Given I have an existing user without a specified image
    When I request the image for that user
    Then the image should be the default Moishe House image 
