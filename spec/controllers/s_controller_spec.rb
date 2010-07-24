require 'spec_helper'

describe SController do

  describe "#index" do 
    it "should render view" do
      Base52.should_receive(:decode).with("abc",SHORT_URL_OFFSET).and_return(1)
      entry = Entries::Base.new
      Entries::Base.should_receive(:find_by_id).with(1).and_return(entry)
      get :index, :id => "abc"
      response.should render_template "index"
      response.should be_success
      assigns(:entry).should == entry
    end

    it "should return 404 if entry donesn't exist" do
      Base52.should_receive(:decode).with("abc",SHORT_URL_OFFSET).and_return(1)
      Entries::Base.should_receive(:find_by_id).with(1).and_return(false)
      get :index, :id => "abc"
      response.response_code.should == 404
    end
  end
end
