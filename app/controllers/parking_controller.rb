class ParkingController < ApplicationController

  def create_parking
    @parking = current_user.parkings.new(parking_params)
    if @parking.save
      redirect_to home_path
    else
      redirect_to home_path
    end
  end

  private

  def parking_params
    params.permit(:coord, :time_out, :street_name, :start_cross_street, :end_cross_street, :side_of_street)
  end

end
