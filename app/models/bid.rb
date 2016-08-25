class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :price, presence: :true
end
