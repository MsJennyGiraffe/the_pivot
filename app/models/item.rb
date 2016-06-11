class Item < ActiveRecord::Base
  belongs_to :category
  validates :category, presence: true

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_path, presence: true


  def self.search(search)
    query = "%#{search}%"
    self.where("title ILIKE ? or description ILIKE ?", query, query)
  end

  def self.featured_home_items(quantity)
    Item.order("RANDOM()").limit(quantity)
  end
end
