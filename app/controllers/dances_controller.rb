# app/controllers/dances_controller.rb
class DancesController < ApplicationController
  before_action :authenticate_user!  # Make sure user is logged in
  # before_action :set_dance

  def index
    @dances = Dance.all
  end

  def new
    @dance = Dance.new
  end

  def show
    @dance = Dance.find(params[:id])
    @users = User.all
    @dancers = @dance.users
  end

  def create
    @dance = Dance.new(dance_params)
    if @dance.save
      redirect_to @dance, notice: 'Dance was successfully created.'
    else
      render :new
    end
  end

  def edit
    @dance = Dance.find(params[:id])
    @levels = @dance.levels
    # @levels = Level.all
  end

  def update
    if @dance.update(dance_params)
      redirect_to @dance, notice: 'Dance was successfully updated.'
    else
      render :edit
    end
  end

  # def update
  #   @dance = Dance.find(params[:id])
  #   # Assuming you have a form where dance_ids is being sent as an array
  #   selected_levels = params[:dance][:level_ids].reject(&:empty?).map(&:to_i)

  #   if @user.update(user_params.merge(dance_ids: selected_levels))
  #     if request.xhr?  # Check if the request is coming from AJAX
  #       render json: { success: true, dance: @dance }, status: :ok
  #     else
  #       redirect_to @dance, notice: "Profile updated successfully!"
  #     end
  #   else
  #     if request.xhr?
  #       render json: { success: false, errors: @user.errors.full_messages }, status: :unprocessable_entity
  #     else
  #     @levels = Level.all
  #     render :edit
  #     end
  #   end
  # end

  def select
    @dance = Dance.find(params[:id])
    current_user.dances << @dance
    redirect_to dances_path, notice: "You have successfully selected the dance: #{@dance.name}."
  end

  private

  def set_user
    @user = User.find(params[:user_id])  # Assuming user is passed in URL
  end

  def set_dance
    @dance = @user.dances.find(params[:id])# Find the dance associated with the user
    # @dance = Dance.find(params[:dance_id])
  end

  def dance_params
    params.require(:dance).permit(:name, :experience, :challenge, level_ids: [])
  end
end
