class InterestsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @title = "All interests for #{@user.name}"
    @interests = @user.interests
  end

  def create
    @user = User.find(session[:user_id])
    interest_name = params[:interest].values.first
    @interest = Interest.new(:user_id => @user.id, :name => interest_name)
    if @interest.save
      flash.now[:success] = "Interest added"
      render 'new'
    else
      flash.now[:error] = "Sorry, there was a problem adding the interest"
      render 'new'
    end
  end

  def new
    @user = User.find(session[:user_id])
    @title = 'Find new matches'
  end

  def destroy
    interest = Interest.find(params[:id])
    # check the interest is owned by the logged in user
    if interest.user_id == session[:user_id]
      interest.destroy
      flash.now[:success] = "Removed interest"
    else
      flash.now[:error] = "Cannot delete unowned interest. Are you logged in?"
    end
    render 'new'
  end




end

