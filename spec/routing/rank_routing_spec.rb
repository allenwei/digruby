require 'spec_helper'

describe RankController do 
  describe "routing" do 
    it "recognizes and generates #like/1" do 
      {:post => "/rank/like/1"}.should route_to(:controller => "rank",:action => "like",:id => "1")
    end
    it "can't be recognized if use get method for #like/1" do
      {:get => "/rank/like/1"}.should_not be_routable
    end

    it "can't be recognized if use invalid id" do
      {:get => "/rank/like/abc"}.should_not be_routable
    end
  end
end
