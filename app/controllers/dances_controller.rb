# app/controllers/dances_controller.rb
class DancesController < ApplicationController
  before_action :authenticate_user!  # Make sure user is logged in

  def index
    @dances = Dance.all
  end

  def select
    @dance = Dance.find(params[:id])
    current_user.dances << @dance  # Associate the dance with the current user

    redirect_to dances_path, notice: "You have successfully selected the dance: #{@dance.name}."
  end
end
