Feature: Merge articles
  As a blog administrator
  In order to consolidate repetative content into larger articles
  I want to be able to merge two articles into one article

Background:
  Given the blog is set up
  And I am logged in as an administrator
  And there is an article "WUT" by "Vasya" saying "Some random text"
  And there is also an article "Nope" by "Anonymous" saying "It was not me"
  And then I log in as a non-administrator

Scenario: Non-administrator cannot merge articles
  When I go to the edit page for the article "WUT"
  And I try to merge it with the article "Nope"
  Then I should see an error message
  And I should see the article "Nope"