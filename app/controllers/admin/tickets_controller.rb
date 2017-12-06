class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:destroy, :show, :edit, :update]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to admin_tickets_path, notice: 'Билет создан'
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket), notice: 'Билет обновлен'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
      redirect_to admin_tickets_path, notice: 'Билет удален'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:user_id, :passenger_name, :passenger_lastname, :passenger_patronymic, :passport_series, :passport_number, :start_station_id, :finish_station_id, :train_id)
  end
end
