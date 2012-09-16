class Report < ActiveRecord::Base

  attr_accessible :date, :amount
  
  belongs_to :user


  
end
