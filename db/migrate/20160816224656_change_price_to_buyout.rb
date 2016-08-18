class ChangePriceToBuyout < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :price, :buyout_price
  end
end
