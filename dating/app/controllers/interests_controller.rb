class InterestsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @interests = params[:interest].values.collect{ |inter| Interest.new( inter ) }
    # try to create new interest records for each interest
    if @interests.all(&:valid?)
      @interests.each(&:save!)
      flash[:success] = 'You have added some interests - check for new matches!'
      redirect_to home_user_path( @user )
    else

      flash.now[:error] = 'There was an error saving your interests'
      render 'new'
    end
  end

  def new
    @title = 'Find new matches'
  end

  def destroy
  end

end

