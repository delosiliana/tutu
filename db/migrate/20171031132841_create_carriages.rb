class CreateCarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :upper_seats
      t.integer :lower_seats
      t.integer :side_upper_seats
      t.integer :side_lower_seats
      t.string :type
      t.belongs_to :train

      t.timestamps
    end
  end
end
