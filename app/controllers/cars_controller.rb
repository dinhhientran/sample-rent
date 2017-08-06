class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :new, :create]

  # GET /cars
  def index
    if params[:search]
      @cars = Car.search(params[:search]).order("created_at DESC")
    else
      @cars = Car.get_cars
    end
  end

  # GET /cars/1
  def show
    @car = Car.find(params[:id])
  end

  # GET /cars/new
  def new
    @car = Car.new
    @public_year = ["2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007"]
    @seat = [2,4,7,9,16,40]
    @colors = ["green","blue","white","black","red","other"]
  end

  # GET /cars/1/edit
  def edit
    @public_year = ["2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007"]
    @seat = [2,4,7,9,16,40]
    @colors = ["green","blue","white","black","red","other"]
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    @car.user = current_user

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:brand, :model, :seat, :color, :price, :public_year, :description, :user_id, :activate, :image)
    end
end
