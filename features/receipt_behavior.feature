Feature: Receipt Behavior

  Scenario: Submitted receipt knows it's status
    Given I have submitted a receipt
    When I examine that receipt
    Then the status of the receipt is submitted

  Scenario: Submitted receipt background is the correct color
    Given I have submitted a receipt
    When I examine that receipt
    Then the receipt is an informational color

  Scenario: Submitted receipt generates the correct HTML
    Given I have submitted a receipt
    When I examine that receipt
    Then the generated HTML displays Submitted

  Scenario: Submitted receipt knows it's button color
    Given I have submitted a receipt
    When I examine that receipt
    Then the button color is primary

  Scenario: Approved receipt knows it's status
    Given I have approved a receipt
    When I examine that receipt
    Then the status of the receipt is approved

  Scenario: Approved receipt background is the correct color
    Given I have approved a receipt
    When I examine that receipt
    Then the receipt is a successful color

  Scenario: Approved receipt generates the correct HTML
    Given I have approved a receipt
    When I examine that receipt
    Then the generated HTML displays Approved

  Scenario: Approved receipt knows it's button color
    Given I have approved a receipt
    When I examine that receipt
    Then the button color is success

  Scenario: Rejected receipt knows it's status
    Given I have rejected a receipt
    When I examine that receipt
    Then the status of the receipt is rejected

  Scenario: Rejected receipt background is the correct color
    Given I have rejected a receipt
    When I examine that receipt
    Then the receipt is a error color

  Scenario: Rejected receipt generates the correct HTML
    Given I have rejected a receipt
    When I examine that receipt
    Then the generated HTML displays Rejected

  Scenario: Rejected receipt knows it's button color
    Given I have rejected a receipt
    When I examine that receipt
    Then the button color is danger

  Scenario: Receipt with all required information
    Given I have a receipt with all required information
    When I attempt to save that receipt
    Then the receipt save should succeed

  Scenario: Receipt with no amount
    Given I have a receipt missing an amount
    When I attempt to save that receipt
    Then the receipt save should fail

  Scenario: Receipt with negative amount
    Given I have a receipt with a negative amount
    When I attempt to save that receipt
    Then the receipt save should fail

  Scenario: Receipt with no program
    Given I have a receipt missing a program
    When I attempt to save that receipt
    Then the receipt save should fail

  Scenario: Receipt with no status
    Given I have a receipt missing a status
    When I attempt to save that receipt
    Then the receipt save should fail

  Scenario: Receipt with no submitter
    Given I have a receipt with no submitter
    When I attempt to save that receipt
    Then the receipt save should fail

  Scenario: Receipt with no purchaser
    Given I have a receipt with no purchaser
    When I attempt to save that receipt
    Then the receipt save should fail

  Scenario: Receipt with no purpose
    Given I have a receipt with no purpose
    When I attempt to save that receipt
    Then the receipt save should fail    
