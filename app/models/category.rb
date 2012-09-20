class Category < ActiveRecord::Base
  attr_accessible :name, :type, :user_id

  has_many :expenses
  belongs_to :user

end
