class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@reports = Report.all
    @report_hash = Expense.order(:date).sum(:cost, :group => 'date')
    @total_expense = Expense.sum(:cost)
  end
end
