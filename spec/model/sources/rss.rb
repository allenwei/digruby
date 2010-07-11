require 'spec_helper'

describe Sources::Rss do 
  before(:each) do
    @rss = Factory :rss 
  end
  describe "#update" do 
    it "should create entries" do 
      feed = YAML.load_file(data_path.join("digruby_feed.yml"))
      Feedzirra::Feed.should_receive(:fetch_and_parse).with(@rss.feed_url).and_return(feed)
      @rss.update
      @rss.reload
      @rss.should have(feed.entries.size).entries
    end
  end
end
