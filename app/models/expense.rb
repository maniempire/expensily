class Expense < ActiveRecord::Base
  attr_accessible :details, :cost, :date, :category_id

  belongs_to :user
  belongs_to :category
  
  
  def self.get_monthly_expense_hash(user)
    
    expense_hash = Hash.new
    
    expense_month_array = user.expenses.map { |d| d.date.strftime('%B %Y') }.uniq
    
    expense_month_array.each do |expense_month|
      
      expenses = filter_expense_by_month(expense_month, user)
      
      expense_hash[expense_month] = expenses.sum(:cost)
      
    end
    
    return expense_hash
    
  end
  
  def self.filter_expense_by_month(month, user)
    
      date = Chronic.parse(month)

     month_num = date.strftime('%-m')

     expense_year = date.strftime('%Y')

     expenses = Expense.where('extract(month from date) = ? and extract(year from date) = ? and user_id = ?', month_num, expense_year, user.id).order('date desc')

     return expenses
    
  end
  

end
