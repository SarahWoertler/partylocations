# controller to display, delete and make bookings (i.e. modify availabilities)
class Users::AvailabilitiesController < ApplicationController

  def display
    @avails = Availability.where(user_id: current_user.id)
    authorize @avails
  end

  def destroy
    @avail = Availability.find(params[:id])
    @avail.delete

    authorize @avail, :users_destroy?

    redirect_to users_my_bookings_path
  end

  def book
    @avails_dates = []

    @avail = Availability.new
    @avails = Availability.where(user_id: params[:id])

    @avails.each do |a|
      @avails_dates << a.date
    end

    @location = Location.find(params[:id])
    @locations = Location.all

    @user = current_user

    authorize @location, :index?
    authorize @avail, :users_book?
    authorize @avails, :index?
  end

  def create
    location = Location.find(params[:id])

    #TBD
  end
end
