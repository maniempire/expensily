class ExpensesController < ApplicationController

  before_filter :authenticate_user!

  def index
    #@expenses = Expense.order('created_at desc').all
    @expenses = current_user.expenses.order('created_at desc').all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params[:expense])
    if @expense.save
      @expense.update_attribute(:user_id, current_user.id)
      redirect_to expenses_url, :notice => "Successfully created expense."
    else
      render :action => 'new'
    end
  end
end
