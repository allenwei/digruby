Feature: Manage rss source
  In order get articles from rss
  User can submit a rss source and get entries
  wants get all entries of a rss source
  
  @javascript
  Scenario: Create new rss source and get all entries, and next page works
    Given I am on the home page
    When I fill in "homepage-searchinput" with "http://feeds2.feedburner.com/digruby"
    And I press "Submit" within "form#source_url"
    Then the "sources_base_feed_url" field should contain "http://feeds2.feedburner.com/digruby"
    When I press "Submit" within "form#new_sources_base" 
    Then I should see /1/ within ".intro-explore #rss_count"
    And I should see /10/ within ".intro-explore #entry_count"
    And It should have "5" articles
    When I press next page
    Then It should have "10" articles



