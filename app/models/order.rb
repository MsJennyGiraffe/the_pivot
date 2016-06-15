class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  has_one :reservation

  validates :user, presence: :true
  validates :status, presence: :true

  def self.from_cart(cart, user: nil)
    new(user: user).tap { |order| order.order_items = cart.to_order_items }
    #
    # cart.cart_items.map do |cart_item|
    #   order.order_items.new(item: cart_item.item, quantity: cart_item.quantity)
    # end
    # order
  end

  def completed?
    self.status == "completed"
  end

  # def record_order_items(cart)
  #   cart.cart_items.each do |cart_item|
  #     order_item = OrderItem.new
  #     order_item.order_id = self.id
  #     order_item.item = cart_item.item
  #     order_item.quantity = cart_item.quantity
  #     order_
  #   end
  # end
end
