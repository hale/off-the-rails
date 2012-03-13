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
	@user = User.find(session[:user_id])
	@user_for_status = UserInfo.where(:user_id => session[:user_id]).first
	if @user_for_status.nil?
		@user_for_status = UserInfo.new(:user_id => session[:user_id], :status => "You still have no status message")
		@status = @user_for_status.status
	else
		@status = @user_for_status.status
	end
	@user_for_status.save
end

def update_status
	@user_for_status = UserInfo.where(:user_id => session[:user_id]).first
	if @user_for_status.nil?
		@user_for_status = UserInfo.new(:user_id => session[:user_id])
	end
	 @user_for_status.status = params[:user_for_status][:status]
	 if @user_for_status.save
		flash[:success] = "Status updated"
		redirect_to :controller => 'users', :id => session[:user_id], :action => 'home' 
	else
		render 'update_status'
	end
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
