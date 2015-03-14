Feature: Merge articles
  As a blog administrator
  In order to consolidate repetative content into larger articles
  I want to be able to merge two articles into one article

Given the blog is set up
  And I am logged in as an administrator
  And there is an article "WUT" by "Vasya" saying "Some random text"
  And there is also an article "NOpe" by "Anonymous" saying "It was not me"


Scenario: Merging works when both articles exist
  When I go to the edit page for the article "WUT"
  And I try to merge it with the article "Nope"
  Then I should see "Articles merged"
  And I should not see the article "Nope"

Scenario: Merging does not work when the second article does not exist
  When I go to the edit page for the article "WUT"
  And I try to merge it with the article "I don't exist"
  Then I should not see "Articles merged"
  And I should see an error message

Scenario: The new article has comments from both merged articles 

Scenario: The new article has the text of the both articles

Scenario: The new article has title of the first article

Scenario: The new article has the author of the first article

