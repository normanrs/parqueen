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
    params.require(:parking).permit(:coord, :curb_id, :time_out, :street_name, :start_cross_street, :end_cross_street, :side_of_street)
  end
  
end
