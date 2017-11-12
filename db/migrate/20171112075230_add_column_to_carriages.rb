class AddColumnToCarriages < ActiveRecord::Migration[5.1]
  def change
    add_column :carriages, :sitting_seats, :integer
  end
end
