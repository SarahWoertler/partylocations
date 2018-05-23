class LocationsController < ApplicationController
  before_action :find, only: [:show] #gets restaurant from params[:id]
  before_action :all_vars, only: [:index] #gets all @locations, @users, @avail

  def index

    if params[:query].present?
      @locations = Location.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @locations = Location.all
    end

    @locations_with_position = Location.where.not(latitude: nil, longitude: nil)

    @markers = @locations_with_position.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/locations/map_box", locals: { flat: flat }) }
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
