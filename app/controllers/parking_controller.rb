class ParkingController < ApplicationController

  def create
    @parking = current_user.parkings.new(parking_params)
    if @parking.save
      redirect_to home_path
      flash[:notice] = "Parking saved."
    else
      redirect_to home_path
      flash[:notice] = "Parking not saved!"
    end
  end

  private

  def parking_params
    params.require(:parking).permit(:parking_side, :street_name, :start_name, :end_name, :latitude, :longitude)
  end

end
