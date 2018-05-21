class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @users = User.all
    @avail = Availability.all
    # query = params[:query]
    # if query.present?
    #   @locations = Location.where(name: query)
    # else
    #   @locations = Location.all
    # end
  end

  def show
    @location = Location.find(params[:id])
  end
end
