require 'spec_helper'

describe RankController do

  describe "post to like to vote" do
    it "should add rank successfully if he haven't voted" do 
      Entries::Base.should_receive(:exists?).with("1").and_return(true)
      SessionRank.should_receive(:exists?).with(['record_id = ? and session_id =?',"1",session[:session_id]]).and_return(false)
      SessionRank.should_receive(:create!).with(:record_id => "1",:session_id => session[:session_id]).and_return(true)
      @controller.should_receive(:render).with(:json => {:success => true,:msg => "Your vote successful, thanks!"})
      post "like",:id => 1
    end

    it "should not vote successfully if he already voted" do 
      Entries::Base.should_receive(:exists?).with("1").and_return(true)
      SessionRank.should_receive(:exists?).with(['record_id = ? and session_id =?',"1",session[:session_id]]).and_return(true)
      @controller.should_receive(:render).with(:json => {:success => false,:msg => "You already vote this entry."})
      post "like",:id => 1
    end

    it "should note vote successfully if can't find record_id" do 
      Entries::Base.should_receive(:exists?).with("1").and_return(false)
      @controller.should_receive(:render).with(:json => {:success => true,:msg => "Can't find this Entry."})
      post "like",:id => 1
    end
  end
end
