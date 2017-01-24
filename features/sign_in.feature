Feature: Sign in
  In order to get access to protected sections of the site
  A valid user
  Should be able to sign in

    Scenario: Resident user signs in successfully
      Given I exist as a Resident user
      And I am not logged in
      When I sign in
      Then I should be on the page for Residents
      # And I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: MHWOW user signs in successfully
      Given I exist as a MHWOW user
      And I am not logged in
      When I sign in
      Then I should be on the page for MHWOW
      # And I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: Admin user signs in successfully
      Given I exist as a Admin user
      And I am not logged in
      When I sign in
      Then I should be on the page for Admins
      # And I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: Nonmember attempts to sign in
      Given I do not exist as a user
      When I sign in
      Then I see an invalid email or password message
      And I should be signed out

    Scenario: User enters wrong email
      Given I exist as a Resident user
      And I am not logged in
      When I sign in with a wrong email
      Then I see an invalid email or password message
      And I should be signed out
      
    Scenario: User enters wrong password
      Given I exist as a Resident user
      And I am not logged in
      When I sign in with a wrong password
      Then I see an invalid email or password message
      And I should be signed out