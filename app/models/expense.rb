class Expense < ActiveRecord::Base
  attr_accessible :details, :cost, :date

  belongs_to :user

end
