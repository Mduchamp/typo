Feature: Merge Comments

Background: 
  Given the blog is set up
  And I am logged into the admin panel
  And the following article exists: title: "one", author: "me", text: "hi"
  And the following article exists: title: "two", author: "notme", text: "bye"
  And the article "one" has the following comment: "hello"
  And the article "two" has the following comment: "goodbye"

Scenario: Merge Comments
  When I merge "one" with "two"
  And I visit the page for "one"
  Then I should see "hello"
  And I should see "goodbye"