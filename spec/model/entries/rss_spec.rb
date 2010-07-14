require 'spec_helper'

describe Entries::Rss do 
  context "#create_by" do 
    before(:each) do
      Entries::Base.destroy_all
      Sources::Base.destroy_all
      EntriesTags.destroy_all
      Tag.destroy_all
      

      @rss = Factory :rss 
      feed = YAML.load_file(data_path.join("digruby_feed.yml"))
      @entry = feed.entries.first      
    end
    it "should create entry correctly correctly" do 
      mock(Entries::Rss).tags(@entry) {[]}
      expect = Entries::Rss.create_by(@rss,@entry)
      expect.url.should == "http://feedproxy.google.com/~r/DigRuby/~3/GYkxe6E3Ppk/"
      expect.should_not be_nil
      expect.title.should match(/Manage Gems Separately in Different Projects Use Bundler/)
    end 

    it "should create entry with tags" do 
      expect = Entries::Rss.create_by(@rss,@entry)
      expect.should_not be_nil
      expect.title.should match(/Manage Gems Separately in Different Projects Use Bundler/)
      expect.should have(5).tags
      expect.tags.first.name.should == "RubyOnRails".downcase
    end
  end 

  context "#self.tags" do 
      feed = YAML.load_file(data_path.join("digruby_feed.yml"))
      entry = feed.entries.first      
      Entries::Rss.tags(entry).should == %w[RubyOnRails bundler deployment gem passenger]
  end

end
