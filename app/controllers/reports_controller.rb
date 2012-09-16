class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@reports = Report.all
    @report_hash = current_user.expenses.order(:date).sum(:cost, :group => 'date')
    @total_expense = current_user.expenses.sum(:cost)
  end
end
