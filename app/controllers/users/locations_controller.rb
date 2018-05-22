module Users
  class LocationsController < ApplicationController
    before_action :find, only: [:edit, :update, :destroy]

    def index
      @locations = Location.where(user: current_user)
    end

    def new
      @location = Location.new
      @user = current_user
    end

    def create
      @location = Location.new(location_params)
      @location.user = current_user
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

    def all_vars
      @locations = Location.all
      @users = User.all
      @avail = Availability.all
    end
  end
end
