class AddColumnsToItem < ActiveRecord::Migration
  def change
    add_column :items, :avatar_content_type, :string
    add_column :items, :avatar_file_size, :integer
  end
end
