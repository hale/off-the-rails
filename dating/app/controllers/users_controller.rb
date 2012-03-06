class UsersController < ApplicationController

def show
	@user = User.find(params[:id])
	puts '@user is nil' if @user.nil?
	puts '@user.name is nil' if @user.name.nil?
  @title = @user.name
end

def create
	@user = User.new(params[:user])
	if @user.save
		flash[:success] = "Welcome to Dating App"
		redirect_to @user
		# redirect to user's homepage, or the 'edit profile' page of the user
	else
		render('pages/home')
	end
end

def home
	# @title = session[]
end
	
end
