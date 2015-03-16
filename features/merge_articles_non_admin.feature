Feature: Merge articles
  As a blog administrator
  In order to consolidate repetative content into larger articles
  I want to be able to merge two articles into one article

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And the following article exists: title: "WUT", author: "Vasya", text: "Some random text"
  And the following article exists: title: "Nope", author: "Anonymous", text: "It was not me"
  And the user "notadmin" exists
  And I am logged in as "notadmin"

Scenario: Non-administrator cannot merge articles
  When I am at the edit page for "WUT"
  And I should not see "Merge"