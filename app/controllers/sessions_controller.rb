class SessionsController < ApplicationController
  
  before_filter :confirm_logged_in, :except => [:create, :destroy]

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Log them in
      session[:user_id] = user.id
      # Print a welcome message
      flash[:success] = "Welcome back"
      # Rediret to their homepage
      redirect_to home_user_path user
    else
      #print an error
      flash[:error] = "Invalid email or password."
      # re-render the home page
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_url, :notice => "Logged out!"
  end

end
