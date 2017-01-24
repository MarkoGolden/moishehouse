Feature: Creating House and Users
  In order to provide Moishe House with residents and WOW participants
  A valid admin
  Should be able to create houses and users

  # Get this working first
  Scenario: Admin creates house successfully
    Given I am a valid admin and logged in
    When I create a new house without a physical location
    Then I should see that house displayed

  # Get this working second
  Scenario: Admin creates resident successfully
    Given I am a valid admin and logged in
    And I create a new house without a physical location
    When I create a new resident with user full info
    And I assign that resident to that house
    Then I should see that resident displayed
    And resident user should be associated with that house

  # Get this working third
  Scenario: Admin fails to creates resident
    Given I am a valid admin and logged in
    When I create a new resident with user full info
    But I do not assign that resident to any house
    Then I should not see that resident displayed
    And I should see a failed to create user error message

  # You will want similar admin scenarios for other admin user types

  # Also will want admin scenarios (in other files) for grants, etc.

  # You will also want resident scenarios for resident actives
  # and WOW user scenarios for their activities (again in separate files)
  # 
  # Remember to include scenarios for what residents and WOW folks
  # shouldn't be able to do
  # For instance if logged in as resident a resident shouldn't be able 
  # to just type in the house creation url and create a house