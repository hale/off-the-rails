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
      flash.now[:error] = "Invalid email or password."
      # re-render the home page
      render "pages/home"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out!"
  end

end