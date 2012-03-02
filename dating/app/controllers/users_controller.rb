class UsersController < ApplicationController

def show
	@user = User.find(params[:id])
    @title = @user.name
end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "Welcome to Dating App"
			redirect_to root_url
			# redirect to user's homepage, or the 'edit profile' page of the user
		else
			flash[:notice] = "There were problems with the signup form"
			# Need to find a way to refresh the page and display error messages, which means
			# redirecting to root without losing @user attributes, or something.
			# redirect_to :back, :user => @user
			render('pages/home')
		end
	end
	
end
