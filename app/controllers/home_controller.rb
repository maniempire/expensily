class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index

    @total_expenses = current_user.expenses.sum(:cost)

     @total_debts = current_user.loans.sum(:amount)

    @total_credits = current_user.credits.sum(:amount)
    
    @monthly_expense_hash = Expense.get_monthly_expense_hash(current_user)

  end
  
end
