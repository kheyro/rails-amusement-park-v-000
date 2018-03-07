class RidesController < ApplicationController

  def new
  end

  def create
    @ride = Ride.new(ride_params)
    redirect_to user_path(current_user), alert: @ride.take_ride
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
