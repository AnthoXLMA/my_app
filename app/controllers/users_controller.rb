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
        @dances = Dance.all
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
        render :edit
      end
    end
  end

  private

  def set_user
  end

  def user_params
    params.require(:user).permit(:name, :email, dance_ids: [])
  end
end
