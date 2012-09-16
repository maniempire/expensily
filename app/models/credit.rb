class Credit < ActiveRecord::Base
  attr_accessible :given_to, :date, :amount, :details

  belongs_to :user

end
