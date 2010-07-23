require 'spec_helper'

describe Entries::Base do 
  describe "#create_rank" do 
    it "should success" do 
      entry = Entries::Rss.create(:url => "www.digruby.com",:date_published => Date.today)
      assert entry
      assert rank = Rank.first(:conditions => {:record_id => entry.id})
      rank.rank.should == 0
    end
  end 
end

