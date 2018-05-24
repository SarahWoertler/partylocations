# controller to display, delete and make bookings (i.e. modify availabilities)
class Users::AvailabilitiesController < ApplicationController

  def display
    @avails = Availability.where(user_id: current_user.id)
    authorize @avails
  end

  def new_availability
    @avail = Availability.new

    authorize @avail, :users_create_availability?
  end

  def create_availability
    date =  Time.zone.parse(params[:availability][:date])
    location = Location.find(params[:id])
    avail = Availability.create(location_id: location.id, date: date)

    authorize avail, :users_create_availability?

    redirect_to users_locations_path
  end

  def destroy_availability
    @avail = Availability.find(params[:availability_id])
    @avail.delete

    authorize @avail, :users_destroy?

    redirect_to users_locations_path
  end

  # def manage_availability
  #   raise

  #   @locations = Location.where(user: current_user)
  #   @avails = Availability.where(location: @locations)

  #   raise
  # end


  def book
    @avails_dates = []

    @avail = Availability.new
    @avails = Availability.where(location_id: params[:id], user_id: nil)

    @avails.each do |a|
      @avails_dates << a.date
    end

    @location = Location.find(params[:id])
    @locations = Location.all

    @user = current_user

    authorize @location, :true
    authorize @avail, :true
    authorize @avails, :true
  end

  def create_booking
    location = Location.find(params[:id])

    avail_date = params[:availability][:date]

    avail = Availability.find_by_date(avail_date)

    avail.status = "Pending"

    avail.user_id = current_user.id

    avail.save

    authorize avail, :true

    redirect_to users_my_bookings_path
  end

  def delete_user_from_booking
    avail = Availability.find(params[:id])
    avail.user_id = nil
    avail.status = nil
    avail.save!

    authorize avail, :true

    redirect_to users_my_bookings_path
  end

  def accept
    availability = Availability.find(params[:id])
    availability.status = 'Accepted'
    availability.save!
    authorize availability

    redirect_to users_locations_path
  end

  def decline
    availability = Availability.find(params[:id])
    availability.status = 'Declined'
    availability.save!

    authorize availability

    redirect_to users_locations_path
  end

end
