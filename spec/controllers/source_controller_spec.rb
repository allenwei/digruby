require 'spec_helper'

describe SourceController do


  #Delete this example and add some real ones
  it "should use SourceController" do
    controller.should be_an_instance_of(SourceController)
  end


  describe "POST create" do 
    describe "with valid params" do 
      it "create a source " do 
        params = {"name" => "digruby","feed_url" => "http://feeds2.feedburner.com/digruby"}
        mock(Sources::Rss).new(params) do |source|
          mock(source).save {true}
        end
        post :create,:sources_base => {:name => "digruby",:feed_url => "http://feeds2.feedburner.com/digruby"}
        @controller.should_receive(:render).with(:json => {:status => true})
      end

      it "can't create a source if source error happens" do 
        params = {"name" => "digruby","feed_url" => "http://feeds2.feedburner.com/digruby"}
        errors = [["feed_url","is invalid"]]
        mock(Sources::Rss).new(params) do |source|
          mock(source).save {false}
          mock(source).errors {errors}
        end
        post :create,:sources_base => {:name => "digruby",:feed_url => "http://feeds2.feedburner.com/digruby"}
        @controller.should_receive(:render).with(:json => {:status => false,:errors => "feed_url is invalid" })
      end

    end 
  end 
end

