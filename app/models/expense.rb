class Expense < ActiveRecord::Base
  attr_accessible :details, :cost, :date, :category_id

  belongs_to :user
  belongs_to :category

end
