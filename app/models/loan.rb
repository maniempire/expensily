class Loan < ActiveRecord::Base

  attr_accessible :get_from, :date, :amount, :details, :paid_status

  belongs_to :user
  
end
