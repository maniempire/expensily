require File.dirname(__FILE__) + '/../spec_helper'

describe Credit do
  it "should be valid" do
    Credit.new.should be_valid
  end
end
