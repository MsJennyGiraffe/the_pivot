class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :user, presence: :true
  validates :status, presence: :true

  def record_order_items(cart)
    cart.cart_items.each do |cart_item| # => [CartItem, CartItem]
      order_item = OrderItem.new
      order_item.order_id = self.id
      order_item.item = cart_item.item
      order_item.quantity = cart_item.quantity 
      order_item.save
    end
  end
end
