class UsersController < ApplicationController

before_filter :confirm_logged_in, :except => [:create, :destroy]

def show
	# currently doesn't render if the user is not signed in. needs a before filter.
	@user = User.find(params[:id])

  @json = User.all.to_gmaps4rails

	@current_user = User.find(session[:user_id])
	if @user == @current_user 
		flash.now[:info] = "This is your profile page. #{view_context.link_to('Click to edit profile', edit_user_path(@current_user))}".html_safe
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
	# @users = User.all
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
	@user = User.find(session[:user_id])
	@status = @user.status
end

def update_status
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

def search
	if params[:user][:name]
  		@users = User.find(:all, :conditions => ["name LIKE ?","%#{params[:user][:name]}%"])
  	else
  		@users = User.find(:all)
  	end
end

  def find_matches
    @user = User.find(session[:user_id])
    # don't include the current user in the possible matches 
    @users = User.all - [@user] - @user.matches
    # associate each user with the number of shared interests they have with @user
    dates = {}
    @users.each do |u|
      dates[u.id] = @user.shared_interests(u).size
    end

    sorted_dates = dates.sort_by { |user, count| count }
    suggested_matches = []
    sorted_dates.each { |date| suggested_matches << date.first }
    suggested_matches = suggested_matches.last(10).shuffle.first(3)

    @suggested_matches = []
    suggested_matches.each {|sm| @suggested_matches << User.find(sm) }


    @title = "Suggested matches for #{@user.name}"
  end




end
