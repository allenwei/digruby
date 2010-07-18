Feature: Manage rss source
  In order get articles from rss
  I can create a rss source and get entries
  wants get all entries of a rss source
  
  Scenario: Create new rss source and get all entries
    Given A rss source with feed url "http://feeds2.feedburner.com/digruby"
    When I save this rss source
    Then I can get all latest enties


