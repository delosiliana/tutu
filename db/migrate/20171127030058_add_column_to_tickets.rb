class AddColumnToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :passenger_name, :string
    add_column :tickets, :passenger_lastname, :string
    add_column :tickets, :passenger_patronymic, :string

    add_column :tickets, :passport_number, :string
    add_column :tickets, :passport_series, :string
  end
end
