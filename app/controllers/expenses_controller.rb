class ExpensesController < ApplicationController

  before_filter :authenticate_user!

  def index
    #@expenses = Expense.order('created_at desc').all
    #@expenses = current_user.expenses.order('date desc').all.page(params[:page]).per(5)
    
    @expenses = current_user.expenses.order('date desc').page(params[:page]).per(25)
  
    @expense_month_array = current_user.expenses.map { |d| d.date.strftime('%B %Y') }.uniq

    @expense_month_array.push("All")

    @expense_total = current_user.expenses.sum(:cost)
    
    @other_category = Category.where(:id => 1) #category for others

    if current_user.id == 1
      @user_categories = current_user.categories
    else
      @user_categories = current_user.categories + User.find(1).categories  #admin categories which is default
    end
    
    @user_categories = @user_categories - @other_category unless @user_categories.blank?

  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
    if current_user.id == 1
      @user_categories = current_user.categories
    else
      @user_categories = current_user.categories + User.find(1).categories  #admin categories which is default
    end

  end

  def create
    @expense = Expense.new(params[:expense])
    category_value = params[:category_text_input]

    if @expense.save

      unless category_value.blank?

        category = Category.new

        category.update_attributes(:name => category_value, :user_id => current_user.id)

        @expense.update_attribute(:category_id, category.id)

      end

      @expense.update_attribute(:user_id, current_user.id)
      redirect_to expenses_url, :notice => "Successfully created expense."
    else
      render :action => 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
    @user_categories = current_user.categories if current_user.id == 1
    @user_categories = current_user.categories + User.find(1).categories unless current_user.id == 1 #admin categories which is default

  end

  def update
    @expense = Expense.find(params[:id])
    category_value = params[:category_text_input]
    if @expense.update_attributes(params[:expense])

      unless category_value.blank?

        category = Category.new

        category.update_attributes(:name => category_value, :user_id => current_user.id)

        @expense.update_attribute(:category_id, category.id)

      end

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

  def get_monthwise_expenses

    month = params[:expense_month]

    unless month == "All"

      date = Chronic.parse(month)

      month_num = date.strftime('%-m')

      expense_year = date.strftime('%Y')

      @expenses = Expense.where('extract(month from date) = ? and extract(year from date) = ? and user_id = ?', month_num, expense_year, current_user.id).order('date desc').page(params[:page]).per(25)

      @expense_total = @expenses.sum(:cost)

    else

      @expenses = current_user.expenses.order('date desc').page(params[:page]).per(25)

      @expense_total = current_user.expenses.sum(:cost)

    end


  end
  
  def get_categorywise_expenses
    
    category_id = params[:expense_category]
    
    @expenses = current_user.expenses.where(:category_id => category_id).page(params[:page]).per(25) unless category_id.blank?
    
    @expense_total = @expenses.sum(:cost)
    
    
  end
  

end
