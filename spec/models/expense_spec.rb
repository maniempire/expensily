require File.dirname(__FILE__) + '/../spec_helper'

describe Expense do
  it "should be valid" do
    Expense.new.should be_valid
  end
end
