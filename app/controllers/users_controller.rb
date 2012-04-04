class UsersController < ApplicationController

before_filter :confirm_logged_in, :except => [:create, :destroy]

def show
	@user = User.find(params[:id])
  @current_user = User.find(session[:user_id])

  @title = @user.name

  if @user == @current_user 
    flash.now[:info] = "This is your profile page. #{view_context.link_to('Click to edit profile', edit_user_path(@current_user))}".html_safe
  end

  longlat = "#{@user.latitude},#{@user.longitude}"

  @map_string = "http://maps.googleapis.com/maps/api/staticmap?zoom=8&size=370x370&
markers=color:blue%7C#{ longlat }%7C&sensor=false"

	
  
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
  @current_user = User.find(session[:user_id])
end

def create
	@user = User.new(params[:user])
	if @user.save
		flash[:success] = "Welcome to Coitus Cupid!"
		session[:user_id] = @user.id
    redirect_to home_user_path(@user)
	else
    # render 'pages/home'
    flash[:error] = "Please check your details and try again."
    redirect_to signup_path
	end
end

def home
  @current_user = User.find(session[:user_id])
  @user = @current_user
	@status = @current_user.status
end

def update_status
  @current_user = User.find(session[:user_id])

	@user_for_status = User.find(session[:user_id])
	 if @user_for_status && @user_for_status.update_attribute(:status, params[:user_for_status][:status])
	 	TimelineUpdates.create(:user_id => @user_for_status.id, :message => " posted new status message: #{params[:user_for_status][:status]}.")
		flash[:success] = "Status updated"
		redirect_to user_path(@user_for_status)
	else
		flash[:notice] = "Your status could not be updated at this time"
		redirect_to user_path(@user_for_status)
	end
end

def edit
  @current_user = User.find(session[:user_id])

	@user = User.find(params[:id])
	@title = "#{@user.name} - Edit"	
end

def update
  @current_user = User.find(session[:user_id])

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

  @current_user = User.find(session[:user_id])
	@user = User.find(params[:id])
  
	@users = @user.matches
	render 'show_matches'
end

def interested
  @title = 'Interested Users'

  @current_user = User.find(session[:user_id])
  @user = User.find(params[:id])
	
	@users = @user.interested_users
	render 'show_matches'
end

def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to('pages/home')
end

def search
  # uses native postgresql indexing.
  @users = User.search( params[:user][:name] )
end

  # Finds and displays a few suggested matches fot the current (ie logged in) user
  def find_matches    
    @current_user = User.find(session[:user_id])
    @user = @current_user

    @title = "Suggested matches for #{@current_user.name}"

    # don't include the current user or existing matches in the possible matches 
    @users = (User.all - [@current_user]) - @current_user.matches

    # associate each user with the number of shared interests they have with the current user
    users_shared_interests = {}
    @users.each do |user|
      users_shared_interests[user.id] = @current_user.shared_interests(user).size
    end


    suggested_matches = []
    users_shared_interests.sort_by { |user, count| count }.each do |date|
      suggested_matches << date.first
    end
    suggested_matches = suggested_matches.last(10).shuffle.first(3)

    @suggested_matches = []
    suggested_matches.each {|sm| @suggested_matches << User.find(sm) }
  end




end
