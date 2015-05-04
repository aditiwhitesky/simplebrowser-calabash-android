Feature: Test the Simple Browser

  Scenario: As a user I should be able to view the page requested
    Given I am on the Home Screen
    Then I enter text "wellsfargo.com" into field with id "address"
    Then I press enter
    Then I should see webview text "Sign On" in element with id "load-login"

  Scenario: As a user I should be able to go back the page history
    Given I am on the Home Screen
    Then I enter text "wellsfargo.com" into field with id "address"
    Then I press enter
    Then I clear input field with id "address"
    Then I enter text "yahoo.com" into field with id "address"
    Then I press enter
    Then I wait for 2 seconds
    Then I press view with id "back"
    Then I wait for 2 seconds
    Then I should see webview text "Sign On" in element with id "load-login"

  Scenario: As a user I should be able to go forward the page history
    Given I am on the Home Screen
    Then I enter text "yahoo.com" into field with id "address"
    Then I press enter
    Then I clear input field with id "address"
    Then I enter text "wellsfargo.com" into field with id "address"
    Then I press enter
    Then I wait for 2 seconds
    Then I press view with id "back"
    Then I wait for 2 seconds
    Then I press view with id "forward"
    Then I wait for 2 seconds
    Then I should see webview text "Sign On" in element with id "load-login"

  Scenario: As a user I want to interact with site loaded in the webview for e.g.
  login to yahoo.com
    Given I am on the Home Screen
    Then I enter text "login.yahoo.com" into field with id "address"
    Then I press enter
    Then I wait to see webview element with id "login-username"
    Then I enter text "test1" into webview input field with id "login-username"
    Then I enter text "test" into webview input field with id "login-passwd"
    Then I touch the button in webview with id "login-signin"
    Then I should see webview text "Invalid username/password. Please try again" in element with id "mbr-error"
