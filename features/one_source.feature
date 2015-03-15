Feature: Merge Articles

Background: 
  Given the blog is set up
  And I am logged into the admin panel
  And the following article exists: title: "one", author: "me", text: "hi"
  And the following article exists: title: "two", author: "notme", text: "bye"

Scenario: Merge articles
  Given I am at the edit page for the article "one"
  And I merge it with "two"
  Then I should see the following article: title: "one", author: "me", text: "hi bye"

Scenario: Merge Comments
  Given "one" has the following comments: "hello"
  And given "two" has the following comments: "goodbye"
  And given I am at the edit page for the article "two"
  And I merge it with "one"
  Then the following article should exist: title: "two", author: "notme", text: "bye hi"
  And "two" should have the following comments: "hello", "goodbye"