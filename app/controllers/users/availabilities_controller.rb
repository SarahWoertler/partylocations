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
end
