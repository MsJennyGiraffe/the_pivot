class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  validates :item, presence: :true
  validates :order, presence: :true
end
