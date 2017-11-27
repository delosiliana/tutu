class SearchesController < ApplicationController
  before_action :all_railway_station, only: [:show, :create]

  def show
  end

  def create
    if params[:start_station] == params[:finish_station]
      @error = "Станции не могут совпадать."
      render :show
    else
      @trains = Train.search(params[:start_station], params[:finish_station])
      @start_station = RailwayStation.find(params[:start_station])
      @finish_station = RailwayStation.find(params[:finish_station])
      render :show
    end
  end

  private

  def search_params
    params.require(:stations).permit(:start_station, :finish_station)
  end

  def all_railway_station
    @stations = RailwayStation.all
  end
end
