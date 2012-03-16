class UsersController < ApplicationController

before_filter :confirm_logged_in, :except => :create

def show
	# currently doesn't render if the user is not signed in. needs a before filter.
	@user = User.find(params[:id])

  @json = User.all.to_gmaps4rails

	@current_user = User.find(session[:user_id])
	if @user == @current_user 
		flash.now[:info] = "This is your profile page."
	end
  @title = @user.name
  
  Twitter.configure do |config|
  config.consumer_key = "MjVwLYH2g497RAIZqBAOtQ"
  config.consumer_secret = "VNYdkUCERELhlkGkJn30iTfepgpwI1hMD6L0Cl7cKw"
  config.oauth_token = "48442779-Nyimp2WTO1fQufRgZPM91BQaSx7jTkh07h6E66K5j"
  config.oauth_token_secret = "pwk0OJkXjHa1Ph0S0H2lPOnaLs7d5r3qEq6qvMwQ"
  end
end

def index
	@title = "All users"
	@users = User.all
end

def create
	@user = User.new(params[:user])
	@user_status = UserInfo.new
	@user_status.user_id = @user.id
	@user_status.status = "You have no status message."
	
	#geocoded_by request.remote_ip,
  #    :latitude => @user.latitude, :longitude => @user.longitude

	if @user.save && @user_status.save
		flash[:success] = "Welcome to Dating App"
		session[:user_id] = @user.id
    redirect_to home_user_path(@user)
	else
		redirect_to root_url
	end
end

def home
	@user = User.find(session[:user_id])
	@user_for_status = UserInfo.where(:user_id => session[:user_id]).first
	if !@user_for_status.nil?
		@status = @user_for_status.status
	else
		@status = "You have no status message."
	end
end

def update_status
	@user_for_status = UserInfo.where(:user_id => session[:user_id]).first
	if @user_for_status.nil?
		@user_for_status = UserInfo.new(:user_id => session[:user_id], :status => "You still have no status message.")
	end
	 @user_for_status.status = params[:user_for_status][:status]
	 if @user_for_status.save
	 	TimelineUpdates.create(:user_id => session[:user_id], :message => " posted new status message: #{params[:user_for_status][:status]}.")
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
		TimelineUpdates.new(:user_id => session[:user_id], :message => " updated his/her profile").save
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

def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to('pages/home')
end






end
