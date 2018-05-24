# controller for all basic crud actions with locations

class Users::LocationsController < ApplicationController
  before_action :find, only: [:edit, :update, :destroy]

  def index
    @locations = policy_scope(Location.where(user: current_user))

    authorize @locations
  end

  def new
    @location = Location.new
    @user = current_user

    authorize @location, :users_new?
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    @location.save

    authorize @location, :users_create?

    redirect_to users_locations_path
  end

  def edit
    authorize @location, :users_edit?
  end

  def update
    @location.update(location_params)

    authorize @location, :users_update?
    redirect_to users_locations_path
  end

  def destroy
    @location.destroy

    authorize @location, :users_destroy?

    redirect_to users_locations_path
  end

  private

  def find
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :description, :size, :capacity, :price, :lat, :lng, :type, :occasion, :accessible, :catering, :parking, :smoking, :music, :address)
  end

  def all_vars
    @locations = Location.all
    @users = User.all
    @avail = Availability.all
  end
end
