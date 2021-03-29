class RidesController < ApplicationController
  
  def create
    @ride = current_user.rides.new(rides_params)
    result = @ride.take_ride
    if result == true
      @ride.save
      flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"
    else 
      flash[:error] = result 
    end
    redirect_to user_path(current_user)
  end

  private

  def rides_params
    params.require(:ride).permit(:attraction_id)
  end

end