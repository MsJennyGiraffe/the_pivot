class RemoveOccupationFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :occupation, :string
  end
end