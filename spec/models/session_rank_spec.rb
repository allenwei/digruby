require 'spec_helper'

describe SessionRank do 
  describe "#update_rank" do 
    it "rank should add 1 after create new session rank" do 
      rank = Rank.create!(:record_id => 1)
      SessionRank.create!(:record_id => 1, :session_id => "abcd")
      rank.reload.rank.should == 1
      SessionRank.create!(:record_id => 1, :session_id => "dcba")
      rank.reload.rank.should == 2
    end
  end
end
