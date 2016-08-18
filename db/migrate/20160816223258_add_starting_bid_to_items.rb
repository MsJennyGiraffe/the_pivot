class AddStartingBidToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :starting_bid, :float, default: 0.01 
  end
end
