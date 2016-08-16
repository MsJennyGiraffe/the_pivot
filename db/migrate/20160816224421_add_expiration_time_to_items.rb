class AddExpirationTimeToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :expiration_time, :datetime
  end
end
