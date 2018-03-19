Feature: Schedule visit
  This feature is used to test the below functionality in Zolo website
  -> Scheduling a visit

#Assignment - PART 1
  Scenario: Verify the functionality of scheduling a visit
    Given I access zolo website
    And I login with valid credentials
    And I select an address by entering a keyword "electronic" in the search bar
    And I apply few filters
    And I select "Zolo Goodfellas for men" from the search results
    And the property details should be displayed
    When I schedule a visit by clicking on schedule a visit
    Then I should be able to see the confirmation page