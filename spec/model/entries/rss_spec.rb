require 'spec_helper'

describe Entries::Rss do 
  context "new_entry_attrs" do 
    before(:all) do
      debugger
      @raw_entry = Factory.build(:raw_entry)
    end
    it "should mapping attributes correctly" do 
      Entries::Rss.create_by(@raw_entry)
    end 
  end 
end
