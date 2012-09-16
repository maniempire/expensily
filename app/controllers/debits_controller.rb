class DebitsController < ApplicationController
  def index
    #@debits = Debit.all

    @debits = current_user.credits
    
  end

  def show
    @debit = Debit.find(params[:id])
  end

  def new
    @debit = Debit.new
  end

  def create
    @debit = Debit.new(params[:debit])
    if @debit.save
      @debit.update_attribute(:user_id, current_user.id)
      redirect_to @debit, :notice => "Successfully created debit."
    else
      render :action => 'new'
    end
  end

  def edit
    @debit = Debit.find(params[:id])
  end

  def update
    @debit = Debit.find(params[:id])
    if @debit.update_attributes(params[:debit])
      redirect_to @debit, :notice  => "Successfully updated debit."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @debit = Debit.find(params[:id])
    @debit.destroy
    redirect_to debits_url, :notice => "Successfully destroyed debit."
  end
end
