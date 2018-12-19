class ParkingController < ApplicationController

  def show
    @facade = ParkingFacade.new(params)
  end
end
