class UsersController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated


  def index
    @users = User.all
  end
  # Show user profile
  def show
    @user = current_user
    @dances = Dance.all
    @selected_dances = []
  end

  def new
    @user = User.new
    @dances = Dance.all
  end

  def create
    @user = User.new(user_params)
    # Don't forget to handle the dance_ids array properly
    @user.dance_ids = params[:user][:dance_ids].reject(&:empty?) # Remove empty strings
    if @user.save
      redirect_to @user, notice: "User and selected dances saved successfully!"
    else
      render :new
    end
  end

  def edit
    @user = current_user  # Use current_user to edit the logged-in user
    @dances = Dance.all
  end

  def update
    @user = current_user
    @dances = Dance.all
    @selected_dances = Dance.find(params[:user][:dances])
    if @user.update(dances: @selected_dances)
      redirect_to @user, notice: "Your profile has been updated!"
    else
      render :edit
    end
  end

  # def update
  #   @user = current_user
  #   @dances = Dance.all
  #   Rails.logger.debug "PARAMS: #{params.inspect}"  # This will log the submitted form data
  #   if @user.update(user_params)
  #     redirect_to @user, notice: "Your profile has been updated!"
  #   else
  #     render :edit
  #   end
  # end

  private

  def set_user
  end

  def user_params
    # Don't forget to allow the selected_dances field to be saved
    params.require(:user).permit(:name, :email, dance_ids: [])
    # params.require(:user).permit(:first_name, :email, dance_ids: [])
    # dances = params.require(:user).permit(:first_name, :email, dances: [])[:dances]
    # # Remove empty or invalid dance IDs
    # dances = @dances.reject { |dance_id| dance_id.blank? }
    # { dances: @dances }
  end
end
