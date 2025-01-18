# app/controllers/dances_controller.rb
class DancesController < ApplicationController
  before_action :authenticate_user!  # Make sure user is logged in

  def index
    @dances = Dance.all
  end

  def select
    @dance = Dance.find(params[:id])
    current_user.dances << @dance
    redirect_to dances_path, notice: "You have successfully selected the dance: #{@dance.name}."
  end

  private

  def set_dance
    @dance = Dance.find(params[:id])
  end

  def dance_params
    params.require(:dance).permit(:name, :niveau)
  end
end
