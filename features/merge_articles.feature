Feature: Merge articles
  As a blog administrator
  In order to consolidate repetative content into larger articles
  I want to be able to merge two articles into one article

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And the following article exists: title: "WUT", author: "Vasya", text: "Some random text"
  And the following article exists: title: "Nope", author: "Anonymous", text: "It was not me"

Scenario: Merging works when both articles exist
  Given I merge "WUT" with "Nope"
  When I go to the content page
  Then I should see "WUT"
  And I should not see "Nope"

Scenario: Merging does not work when the second article does not exist
  When I merge "WUT" with "I don't exist"
  Then I should see "Error, one of the articles does not exist"

