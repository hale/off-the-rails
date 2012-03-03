class UsersController < ApplicationController

def show
	@user = User.find(params[:id])
    @title = @user.name
end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome to Dating App"
			redirect_to root_url
			# redirect to user's homepage, or the 'edit profile' page of the user
		else
			render('pages/home')
		end
	end
	
end
