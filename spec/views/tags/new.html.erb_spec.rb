require 'spec_helper'

describe "/tags/new.html.erb" do
  include TagsHelper

  before(:each) do
    assigns[:tag] = stub_model(Tag,
      :new_record? => true
    )
  end

  it "renders new tag form" do
    render

    response.should have_tag("form[action=?][method=post]", tags_path) do
    end
  end
end
