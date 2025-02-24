class UsersController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated
  # before_action :set_user

  def index
    @users = User.where.not(id: current_user.id)
  end

  # Show user profile
  def show
    if user_signed_in?
    @user   = User.find(params[:id])
    @dances = Dance.all
  # Proceed with action
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
    # @my_dances = @dances.where(id: @user)
  end

  def new
    @user = User.new
    @dances = Dance.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if request.xhr?
        render json: { success: true, user: @user }, status: :created
      else
        redirect_to @user, notice: "Profile created successfully!"
      end
      else
      if request.xhr?
        render json: { success: false, errors: @user.errors.full_messages }, status: :unprocessable_entity
      else
        Rails.logger.debug @user.errors.full_messages
        render :new
      end
    end
  end

  def edit
    @user = current_user  # Use current_user to edit the logged-in user
    @dances = Dance.all
  end

  def update
    @user = User.find(params[:id])
    # Assuming you have a form where dance_ids is being sent as an array
    selected_dances = params[:user][:dance_ids].reject(&:empty?).map(&:to_i)

    if @user.update(user_params.merge(dance_ids: selected_dances))
      if request.xhr?  # Check if the request is coming from AJAX
        render json: { success: true, user: @user }, status: :ok
      else
        redirect_to @user, notice: "Profile updated successfully!"
      end
    else
      if request.xhr?
        render json: { success: false, errors: @user.errors.full_messages }, status: :unprocessable_entity
      else
      @dances = Dance.all
      render :edit
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :gender, :birthday, :experience, :type, :profile_picture, dance_ids: [])
  end

  # def update_dances_with_levels
  #   @user.dance_users.destroy_all  # Clear previous dance selections

  #   dance_ids = params[:user][:dance_ids]
  #   levels = params[:user][:level] # Assuming `level` is an array of levels corresponding to dance_ids

  #   if dance_ids && levels
  #     dance_ids.each_with_index do |dance_id, index|
  #       next if dance_id.blank? # Skip if no dance is selected

  #       # Create a new DanceUser association with level
  #       @user.dance_users.create(dance_id: dance_id, level: levels[index])
  #     end
  #   end
  # end

  # def set_dance
  #   @dance = @user.dances.find(params[:id])  # Find the dance associated with the user
  # end

  # def dance_params
  #   params.require(:dance).permit(:name, :experience, level_ids: [])  # Permit level_ids (an array of selected levels)
  # end
end
