class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index

    @total_expenses = Expense.sum(:cost)

     @total_debts = Loan.sum(:amount)

    @total_credits = Credit.sum(:amount)

  end
end
