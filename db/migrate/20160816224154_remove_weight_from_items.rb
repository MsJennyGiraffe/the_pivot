class RemoveWeightFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :weight, :integer
    remove_column :items, :stock, :integer
  end
end
