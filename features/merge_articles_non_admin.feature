Feature: Merge articles
  As a blog administrator
  In order to consolidate repetative content into larger articles
  I want to be able to merge two articles into one article

Background:
  Given the blog is set up
  And there are two articles in it
  And I am logged in as non-administrator

Scenario: Non-administrator cannot merge articles
