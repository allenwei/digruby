require 'spec_helper'

describe Sources::Rss do 
  before(:each) do
    @rss = Factory :rss 
    Entries::Base.destroy_all
    Sources::Base.destroy_all
    EntriesTags.destroy_all
    Tag.destroy_all
  end
  describe "#update" do 
    it "should create entries" do 
      feed = YAML.load_file(data_path.join("digruby_feed.yml"))
      mock(Feedzirra::Feed).fetch_and_parse(@rss.feed_url) {feed}
      mock(Entries::Rss).create_by(@rss,is_a(Feedzirra::Parser::RSSEntry)).times(10)
      @rss.update
    end

    it "return false if no feed found" do 
      mock(Feedzirra::Feed).fetch_and_parse(@rss.feed_url) {nil}
      assert !@rss.update
    end
  end

end
