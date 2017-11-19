class RenameCarriagesType < ActiveRecord::Migration[5.1]
  def change
    change_table :carriages do |t|
      t.remove :carriage_type
      t.string :type
    end
  end
end
