class Expense < ActiveRecord::Base
  attr_accessible :details, :cost, :date
end
