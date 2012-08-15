class Debit < ActiveRecord::Base
  attr_accessible :get_from, :date, :amount, :details
end
