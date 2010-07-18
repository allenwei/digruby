Given /^(?:|A )rss source with feed url "([^"]*)"$/ do |feed_url|
  @feed_url = feed_url
  @feed = YAML.load_file(Rails.root.join('spec','data',"digruby_feed.yml"))
end

When /^I save this rss source$/ do
  Feedzirra::Feed.stub!(:fetch_and_parse).with(@feed_url).and_return(@feed)
  @rss = Sources::Rss.create(:feed_url =>@feed_url)
  @rss.should_not be_new_record
end

Then /^I can get all latest enties$/ do 
  Feedzirra::Feed.stub!(:fetch_and_parse).with(@feed_url).and_return(@feed)
  @rss.should have(Feedzirra::Feed.fetch_and_parse(@feed_url).entries.size).entries
end

