class SearchesController < ApplicationController

  def create
    @stations = RailwayStation.all
    if params[:start_station] == params[:finish_station]
      @error = "Станции не могут совпадать."
    else
      @trains = Train.search_by_stations(params[:start_station], params[:finish_station])
      @start_station = RailwayStation.find(params[:start_station])
      @finish_station = RailwayStation.find(params[:finish_station])
    end
    render :show
  end

  private

  def search_params
    params.require(:stations).permit(:start_station, :finish_station)
  end
end
