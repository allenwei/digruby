require 'spec_helper'

describe Sources::Rss do 
  before(:each) do
    #@rss = Factory :rss 
    #Entries::Base.destroy_all
    #Sources::Base.destroy_all
    #EntriesTags.destroy_all
    #Tag.destroy_all
  end
  describe "#create" do 
  end

  describe "#feed_url_valid?" do 
    it "should return false if url is invalid" do 
      Sources::Rss.new(:feed_url => "abc").should_not be_feed_url_valid
      Sources::Rss.new(:feed_url => "www.google.com").should_not be_feed_url_valid
      Sources::Rss.new.should_not be_feed_url_valid
      feed_url = "http://feeds2.feedburner.com/digruby"
      mock(Feedzirra::Feed).fetch_and_parse(feed_url) {nil}
      Sources::Rss.new(:feed_url => feed_url).should_not be_feed_url_valid
    end

    it "should store Feedzirra::Feed object if url is valid" do
      feed_url = "http://feeds2.feedburner.com/digruby"
      feed = YAML.load_file(data_path.join("digruby_feed.yml"))
      mock(Feedzirra::Feed).fetch_and_parse(feed_url) {feed}
      rss = Sources::Rss.new(:feed_url => feed_url)
      rss.should be_feed_url_valid
      assert !rss.feed.nil?
    end
  end

  describe "#validate" do 
    it "should not valid if feed_url is not valid" do 
      rss = Sources::Rss.new(:feed_url => "abc")
      rss.should_receive(:feed_url_valid?).and_return(false)
      rss.should_not be_valid
      rss.should have(1).errors
      rss = Sources::Rss.new(:feed_url => "abc")
      rss.should_receive(:feed_url_valid?).and_return(true)
      rss.should be_valid
    end
  end

  describe "#save_entries" do 
    before(:each) do 
      @feed_url = "http://feeds2.feedburner.com/digruby"
      @feed = YAML.load_file(data_path.join("digruby_feed.yml"))
      Feedzirra::Feed.stub!(:fetch_and_parse).with(@feed_url).and_return(@feed)
    end

    it "should store entries correctly" do 
      rss = Sources::Rss.new(:feed_url => @feed_url)
      rss.should_receive(:create_entry).with(anything).exactly(@feed.entries.size).times
      rss.save
    end
  end

  describe "#create_entry" do 
    before(:each) do 
      @feed_url = "http://feeds2.feedburner.com/digruby"
      @feed = YAML.load_file(data_path.join("digruby_feed.yml"))
      Feedzirra::Feed.stub!(:fetch_and_parse).with(@feed_url).and_return(@feed)
    end

  end

end
