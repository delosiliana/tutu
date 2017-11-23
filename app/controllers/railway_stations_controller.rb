class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position]

  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)
    if @railway_station.save
      redirect_to @railway_station, notice: 'Станция создана.'
    else
      render :new
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    if @railway_station.update(railway_station_params)
      redirect_to @railway_station, notice: 'Станция обновлена.'
    else
      render :edit
    end
  end

  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position])
    redirect_to @route
  end

  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    redirect_to railway_stations_url, notice: 'Станция удалена.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
