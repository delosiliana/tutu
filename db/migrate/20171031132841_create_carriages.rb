class CreateCarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :upper_seats
      t.integer :lower_seats
      t.string :carriage_type
      t.integer :train_id
      t.belongs_to :train

      t.timestamps
    end
  end
end
