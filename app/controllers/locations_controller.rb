class LocationsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find, only: [:show] #gets restaurant from params[:id]
  before_action :all_vars, only: [:index] #gets all @locations, @users, @avail

  def index

   # i think this is not needed/ but keep it in case of bug
    # if params[:query].present?
    #   @locations = Location.search_for_location(params[:query])
    # else
    #   @locations = Location.all
    # end

    if params[:location].present?
      @locations = Location.search_for_location(params[:location])
      if params[:location_type].present?
        @locations = @locations.where(location_type: params[:location_type])
      end
      if params[:occasion].present?
        @locations = @locations.where(occasion: params[:occasion])
      end
    else
      @locations = Location.all
    end

    @locations_with_position = @locations.where.not(latitude: nil, longitude: nil)
      @markers = @locations_with_position.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude,
          # setLabel(location.id)
          # label: location.id.to_s
        }
      end

    @locations = policy_scope(@locations)
    @users = policy_scope(@users)
    @avail = policy_scope(@avail)
  end

  def show
    authorize @location
  end

  private

  def find
    @location = Location.find(params[:id])
  end

  def all_vars
    @locations = Location.all
    @users = User.all
    @avail = Availability.all
  end
end
