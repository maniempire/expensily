require File.dirname(__FILE__) + '/../spec_helper'

describe Debit do
  it "should be valid" do
    Debit.new.should be_valid
  end
end
