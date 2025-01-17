class UsersController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated


  def index
    @users = User.all
  end
  # Show user profile
  def show
    @user = current_user
  end
end
