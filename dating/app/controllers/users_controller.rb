class UsersController < ApplicationController

def show
	@user = User.find(params[:id])
  @title = @user.name
end

def create
	@user = User.new(params[:user])
	if @user.save
		flash[:success] = "Welcome to Dating App"
      redirect_to :controller => 'users', :id => session[:user_id], :action => 'home' 
		# redirect to user's homepage, or the 'edit profile' page of the user
	else
		render('pages/home')
	end
end

def home
	# @title = session[]
end

def edit
	@user = User.find(params[:id])
	@title = "#{@user.name} - Edit"	
end

def update
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated"
		# sign_in @user
		redirect_to @user
	else
		render 'edit'
	end
end






end
