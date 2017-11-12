class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to @carriage, notice: 'Вагон создан'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage, notice: 'Вагон обновлен'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path, notice: 'Вагон удален'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :train_id, :upper_seats, :lower_seats, :side_upper_seats, :side_lower_seats,:sitting_seats, :type)
  end
end
