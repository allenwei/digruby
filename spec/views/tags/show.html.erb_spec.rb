require 'spec_helper'

describe "/tags/show.html.erb" do
  include TagsHelper
  before(:each) do
    assigns[:tag] = @tag = stub_model(Tag)
  end

  it "renders attributes in <p>" do
    render
  end
end
