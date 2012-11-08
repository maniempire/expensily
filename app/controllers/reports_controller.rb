class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@reports = Report.all
    @report_hash = current_user.expenses.order(:date).sum(:cost, :group => 'date')
    @total_expense = current_user.expenses.sum(:cost)
    @category_report = current_user.expenses.order(:category_id).sum(:cost, :group => 'category_id')
    
    #@expenses = Expense.select("SUM(cost) as total_cost, MONTH(date) as month, YEAR(date) as year").group("MONTH(date), YEAR(date)") 
    #@data = @expenses.map {|expense| [expense.total_cost, expense.month, expense.year]}
    
  end
end
