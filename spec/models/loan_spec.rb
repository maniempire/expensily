require File.dirname(__FILE__) + '/../spec_helper'

describe Loan do
  it "should be valid" do
    Loan.new.should be_valid
  end
end
