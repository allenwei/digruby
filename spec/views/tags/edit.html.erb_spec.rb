require 'spec_helper'

describe "/tags/edit.html.erb" do
  include TagsHelper

  before(:each) do
    assigns[:tag] = @tag = stub_model(Tag,
      :new_record? => false
    )
  end

  it "renders the edit tag form" do
    render

    response.should have_tag("form[action=#{tag_path(@tag)}][method=post]") do
    end
  end
end
