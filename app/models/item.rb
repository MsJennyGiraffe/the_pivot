class Item < ActiveRecord::Base
  belongs_to :category

  def self.search(search)
    query = "%#{search}%"
    self.where("title ILIKE ? or description ILIKE ?", query, query)
  end
end
