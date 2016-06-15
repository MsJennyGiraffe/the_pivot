class AddStockToItems < ActiveRecord::Migration
  def change
    add_column :items, :stock, :integer, default: 0
  end
end
