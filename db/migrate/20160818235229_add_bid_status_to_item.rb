class AddBidStatusToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :bid_status, :integer, default: 0
  end
end
