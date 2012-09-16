class CreditsController < ApplicationController

  before_filter :authenticate_user!

  def index
    #@credits = Credit.all
    @credits = current_user.credits
  end

  def show
    @credit = Credit.find(params[:id])
  end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(params[:credit])
    if @credit.save
      @credit.update_attribute(:user_id, current_user.id)
      redirect_to @credit, :notice => "Successfully created credit."
    else
      render :action => 'new'
    end
  end

  def edit
    @credit = Credit.find(params[:id])
  end

  def update
    @credit = Credit.find(params[:id])
    if @credit.update_attributes(params[:credit])
      redirect_to @credit, :notice  => "Successfully updated credit."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @credit = Credit.find(params[:id])
    @credit.destroy
    redirect_to credits_url, :notice => "Successfully destroyed credit."
  end
end
