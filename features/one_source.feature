Feature: Merge Articles

Background: 
  Given the blog is set up
  And I am logged into the admin panel
  And the following article exists: title: "one", author: "me", text: "hi"
  And the following article exists: title: "two", author: "notme", text: "bye"

Scenario: Merge articles
  Given I merge "one" with "two"
  When I go to the content page
  Then I should see "one"
  And I should not see "two"