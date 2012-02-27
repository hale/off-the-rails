class UsersController < ApplicationController
	def new
		@user = User.new
		@title = 'Sign up'
	end

	 def show
    @user = User.find(params[:id])
    @title = @user.name
  end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to root_url, :notice => "You have succesfully registered!"
		else
			@title = 'Sign up'
			render "new"
		end
	end
	
end
