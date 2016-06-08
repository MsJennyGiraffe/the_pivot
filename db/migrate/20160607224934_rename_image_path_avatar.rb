class RenameImagePathAvatar < ActiveRecord::Migration
  def change
    rename_column :items, :image_path, :avatar_file_name
  end
end
