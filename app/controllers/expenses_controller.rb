class ExpensesController < ApplicationController

  before_filter :authenticate_user!

  def index
    #@expenses = Expense.order('created_at desc').all
    @expenses = current_user.expenses.order('created_at desc').all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
    @user_categories = current_user.categories + User.find(1).categories #admin categories which is default
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

   def edit
    @expense = Expense.find(params[:id])
    @user_categories = current_user.categories + User.find(1).categories #admin categories which is default
    
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(params[:expense])
      redirect_to @expense, :notice  => "Successfully updated expense."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to expenses_url, :notice => "Successfully destroyed expense."
  end

end
