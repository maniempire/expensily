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
    if current_user.id == 1
       @user_categories = current_user.categories
     else
       @user_categories = current_user.categories + User.find(1).categories  #admin categories which is default
  end
  puts @user_categories
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

end
