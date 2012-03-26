class RelationshipsController < ApplicationController

before_filter :confirm_logged_in

def index
end

def create
  @user = User.find(params[:relationship][:match_id])
  @current_user = User.find session[:user_id]

  @current_user.add_match! @user
  TimelineUpdates.new(:user_id => session[:user_id], :message => " added #{@user.name} as his/her match.").save
  redirect_to @user
end

def new
end

def show
end

def destroy
  @user = Relationship.find(params[:id]).match
  @current_user = User.find session[:user_id]

  @current_user.remove_match! @user
  redirect_to @user
end
  
end