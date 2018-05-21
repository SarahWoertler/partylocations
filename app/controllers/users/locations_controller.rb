class LocationsController < ApplicationController
  before_action :find, only: [:edit, :update, :destroy]

  def index
    @locations = Location.where(user_id: current_user.id)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    @location.save
    redirect_to users_locations_path
  end

  def edit
  end

  def update
    @location.update(location_params)
    redirect_to users_locations_path
  end

  def destroy
    @location.destroy
    redirect_to users_locations_path
  end

  private

  def find
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :description, :size, :capacity, :price, :lat, :lng, :type, :occasion, :accessible, :catering, :parking, :smoking, :music)
  end
end
