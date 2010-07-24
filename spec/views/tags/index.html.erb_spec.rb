require 'spec_helper'

describe "/tags/index.html.erb" do
  include TagsHelper

  before(:each) do
    assigns[:tags] = [
      stub_model(Tag),
      stub_model(Tag)
    ]
  end

  it "renders a list of tags" do
    render
  end
end
