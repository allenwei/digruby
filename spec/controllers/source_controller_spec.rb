require 'spec_helper'

describe SourceController do


  #Delete this example and add some real ones
  it "should use SourceController" do
    controller.should be_an_instance_of(SourceController)
  end


  describe "POST create" do 
    describe "with valid params" do 
      it "create a source and update newly created source" do 
        params = {"name" => "digruby","feed_url" => "http://feeds2.feedburner.com/digruby"}
        mock(Sources::Rss).new(params) do |source|
          mock(source).save {true}
          mock(source).update {true}
        end
        post :create,:sources_base => {:name => "digruby",:feed_url => "http://feeds2.feedburner.com/digruby"}
        @controller.should_receive(:render).with(:json => {:status => true})
      end

      it "create a source and can't update newly created source" do 
        params = {"name" => "digruby","feed_url" => "http://feeds2.feedburner.com/digruby"}
        mock(Sources::Rss).new(params) do |source|
          mock(source).save {true}
          mock(source).update {raise "an exception"}
        end
        post :create,:sources_base => {:name => "digruby",:feed_url => "http://feeds2.feedburner.com/digruby"}
        @controller.should_receive(:render).with(:json => {:status => false,:errors => "Url is not correct!" })
      end
      it "can't create a source" do 
        params = {"name" => "digruby","feed_url" => "http://feeds2.feedburner.com/digruby"}
        error_message = "name can't be blank"
        mock(Sources::Rss).new(params) do |source|
          mock(source).save {false}
          mock(source).errors {error_message}
        end
        post :create,:sources_base => {:name => "digruby",:feed_url => "http://feeds2.feedburner.com/digruby"}
        @controller.should_receive(:render).with(:json => {:status => false,:errors => error_message })
      end

    end 
  end 
end

