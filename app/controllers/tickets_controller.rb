class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:destroy, :show]

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: 'Билет удален'
  end

  private

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:passenger_name, :passenger_lastname, :passenger_patronymic, :passport_series, :passport_number, :start_station_id, :finish_station_id, :train_id)
  end
end
