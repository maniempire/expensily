class ExpensesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params[:expense])
    if @expense.save
      redirect_to expenses_url, :notice => "Successfully created expense."
    else
      render :action => 'new'
    end
  end
end
