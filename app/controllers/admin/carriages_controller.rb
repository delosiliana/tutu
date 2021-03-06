class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to [:admin, @train], notice: 'Вагон создан'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to admin_train_path, notice: 'Вагон обновлен'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_train_path, notice: 'Вагон удален'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :upper_seats, :lower_seats, :side_upper_seats, :side_lower_seats, :sitting_seats, :type)
  end
end
