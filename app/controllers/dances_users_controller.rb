class DancesUsersController < ApplicationController
  before_action :set_user
  before_action :set_dances_user

  def new
    @dance = @user.dances.new
  end

  def create
    @dance = @user.dances.new(dance_params)
    if @dance.save
      redirect_to @user, notice: 'Dance was successfully created.'
    else
      render :new
    end
  end

  def edit
    @dance = @user.dances.find(params[:id])
  end

  def update
    @dance = @user.dances.find(params[:id])
    if @dance.update(dance_params)
      redirect_to @user, notice: 'Dance was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_dances_user
    @user = DancesUserss.find(params[:dances_user_id])  # Assuming user_id is passed in params for nested resources
  end

  def dance_params
    params.require(:dance).permit(:name)  # Allow the level to be assigned
  end
end
