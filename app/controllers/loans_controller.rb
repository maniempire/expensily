class LoansController < ApplicationController
  before_filter :authenticate_user!

  def index
    @loans =  current_user.loans.order('paid_status asc').all
    @total_debts = current_user.loans.sum(:amount)
    @loan_paid = current_user.loans.where(:paid_status => "Paid").sum(:amount)

    @remaining_loan = @total_debts - @loan_paid

  end

  def show
    @loan = Loan.find(params[:id])
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(params[:loan])
    if @loan.save

       if params[:paid_status].blank?
        loan_paid_status = AppConstants.LOAN_NOT_PAID_STATUS
       else
         
         loan_paid_status =  params[:paid_status]

       end

      @loan.update_attributes(:paid_status => loan_paid_status, :user_id => current_user.id )
      redirect_to @loan, :notice => "Successfully created loan."
    else
      render :action => 'new'
    end
  end

  def edit

    @loan = Loan.find(params[:id])
    
  end

  def update
    
    @loan = Loan.find(params[:id])
    if @loan.update_attributes(params[:loan])

       if params[:paid_status].blank?
        @loan.update_attribute(:paid_status, AppConstants.LOAN_NOT_PAID_STATUS)
       else
        @loan.update_attribute(:paid_status, params[:paid_status])
       end
    
      redirect_to @loan, :notice  => "Successfully updated loan."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    redirect_to loans_url, :notice => "Successfully destroyed loan."
  end
end
