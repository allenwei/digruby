require 'spec_helper'

describe Base52 do 
  context "#encode" do 
    it "should handle 1 character" do 
      Base52.encode(1).should == "b"

      Base52.decode("b").should == 1
    end

    it "should handle 2 characters" do 
      Base52.encode(52).should == "ba"

      Base52.decode("ba").should == 52
    end


    it "should handle offset" do 
      Base52.encode(52,3).should == "bd"
      Base52.decode("bd",3).should == 52
    end
  end
end
