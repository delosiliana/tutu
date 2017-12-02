class AddUserIdToTickets < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :tickets, :user
    add_belongs_to :tickets, :start_station, index: true
    add_belongs_to :tickets, :finish_station, index: true
  end
end
