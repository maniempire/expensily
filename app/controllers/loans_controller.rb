class LoansController < ApplicationController
  def index
    @loans = Loan.all
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
