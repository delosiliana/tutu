class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  def index
    @trains = Train.all
  end

  # GET /trains/1
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # POST /trains
  def create
    @train = Train.new(train_params)
    if @train.save
      redirect_to @train, notice: 'Поезд создан'
    else
      render :new
    end
  end

  # GET /trains/1/edit
  def edit
  end

  # PATCH/PUT /trains/1
  def update
    if @train.update(train_params)
      redirect_to @train, notice: 'Поезд изменен'
    else
      render :edit
    end
  end

  # DELETE /trains/1
  def destroy
    @train.destroy
    redirect_to trains_path, notice: 'Поезд удален'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number, :route_id)
    end
end
