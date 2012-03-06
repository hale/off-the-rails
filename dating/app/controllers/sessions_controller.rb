class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Log them in
      session[:user_id] = user.id
      # Print a welcome message
      flash[:success] = "Welcome back"
      # Rediret to their homepage
      redirect_to :controller => 'users', :user_id => user.id, :action => 'home' 
    else
      #print an error
      flash.now[:error] = "Invalid email or password."
      # re-render the home page
      render "pages/home"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
