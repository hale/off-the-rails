class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # redirect to the user home page
      flash[:success] = "Welcome back"
      redirect_to root_url
    else
      flash.now[:error] = "Invalid email or password."
      render "pages/home"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
