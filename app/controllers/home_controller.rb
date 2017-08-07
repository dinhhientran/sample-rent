class HomeController < ApplicationController

  # Get latest 4 cars to show on homepage
  def index
  	@cars = Car.latest_cars
    @users = User.all.where("coordinates is not null")
    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.title user.full_name
      marker.json(:user_id => user.id)
      marker.json(:address => user.full_address)
      marker.json(:full_name => user.full_name)
    end
  end
end
