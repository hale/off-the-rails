class UserController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to root_url, :notice => "You have succesfully registered!"
		else
			render "new"
		end
	end
end
