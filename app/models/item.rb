class Item < ActiveRecord::Base
  belongs_to :category
  validates :category, presence: true

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_path, presence: true
            
end
