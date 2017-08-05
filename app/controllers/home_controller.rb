class HomeController < ApplicationController
  def index
  	@cars = Car.last_cars
  end
end
