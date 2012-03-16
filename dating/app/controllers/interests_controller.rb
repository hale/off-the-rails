class InterestsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @interests = params[:interest].values.collect{ |inter| Interest.new( :user_id => @user.id, :name => inter ) }
    # try to create new interest records for each interest

    all_valid = true
    @interests.each do |i|
      all_valid = all_valid && i.valid?
    end

    if all_valid
      @interests.each {|i| i.save! }
      flash[:success] = 'You have added some interests - check for new matches!'
      redirect_to home_user_path( @user )
    else

      flash.now[:error] = 'There was an error saving your interests'
      # render 'new'
      redirect_to root_url
    end
  end

  def new
    @title = 'Find new matches'
  end

  def destroy
  end

end

