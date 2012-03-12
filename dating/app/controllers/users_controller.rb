class UsersController < ApplicationController

def show
	# currently doesn't render if the user is not signed in. needs a before filter.
	@user = User.find(params[:id])
	@current_user = User.find(session[:user_id])
	if @user == @current_user 
		flash.now[:info] = "This is your profile page."
	end
  @title = @user.name
end

def index
	@title = "All users"
	@users = User.all
end

def create
	@user = User.new(params[:user])
	if @user.save
		flash[:success] = "Welcome to Dating App"
		session[:user_id] = @user.id
    redirect_to home_user_path(@user)
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

def matches
	@title = 'Matches'
	@user = User.find(params[:id])
	@users = @user.matches
	render 'show_matches'
end

def interested
	@title = 'Interested Users'
	@user = User.find(params[:id])
	@users = @user.interested_users
	render 'show_matches'
end






end
