require 'spec_helper'

describe Sources::Rss do 
  before(:each) do
    @rss = Factory :rss 
  end
  describe "#update" do 
    it "should create entries" do 
      feed = YAML.load_file(data_path.join("digruby_feed.yml"))
      mock(Feedzirra::Feed).fetch_and_parse(@rss.feed_url) {feed}
      mock(Entries::Rss).create_by(@rss,is_a(Feedzirra::Parser::RSSEntry)).times(10)
      @rss.update
    end
  end
end
