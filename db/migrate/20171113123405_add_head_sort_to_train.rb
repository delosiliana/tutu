class AddHeadSortToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :head_sort, :boolean, default: true, null: false
  end
end
