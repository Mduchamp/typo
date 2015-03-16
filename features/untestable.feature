Feature: It is impossible to fully test this app
  As a student of CS169
  So that I can show the TAs why I can't implement all the tests
  I want to visit a page and then visit another page in the same test and the second visit will fail

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And the following article exists: title: "Test", author: "failure", text: "When you visit two pages in one tests the second will 404 and redirect. This SHOULDN'T happen, but it does. It makes this app nigh untestable."

Scenario: Reproducing the bug
  When I visit the page for "Test"
  And I am at the edit page for "Test"
  Then I should see "It seems something went wrong."
