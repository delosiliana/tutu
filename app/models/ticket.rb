class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'RailwayStation', foreign_key: :finish_station_id
  belongs_to :train

  validates :passenger_name, :passenger_lastname, :passenger_patronymic, :passport_number, :passport_series, presence: true

  after_create :send_buy_notification
  after_destroy :send_return_notification

  def route_name
    "#{start_station.title} - #{finish_station.title}"
  end

  private

  def send_buy_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_return_notification
    TicketsMailer.return_ticket(self.user, self).deliver_now
  end
end
