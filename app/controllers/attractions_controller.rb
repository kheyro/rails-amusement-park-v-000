class AttractionsController < ApplicationController

  before_action :required_admin, only: [:edit, :new, :create, :update]
  before_action :current_attraction, only: [:show, :edit, :update]

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def edit
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def current_attraction
    @attraction = Attraction.find_by_id(params[:id])
  end
end
