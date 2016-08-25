class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items


  validates :user, presence: :true
  validates :status, presence: :true

  def self.from_cart(cart, user: nil)
    new(user: user).tap { |order| order.order_items = cart.to_order_items }
  end

  def completed?
    status == "completed"
  end

  def self.create_order(current_user,cart,session,flash)
    @order = self.from_cart(cart, user: current_user)
    if !cart.contents.empty?
      @order.update_attribute(:status, "completed")
    else
      return "Cart Empty"
    end
    self.move_cart_to_the_order(cart)
    session.delete :cart
    flash[:success] = "Order was successfully placed"
    @order
  end

  def self.move_cart_to_the_order(cart)
    cart.cart_items.each do |cart_item|
      cart_item_id = cart_item.id
      item = Item.find(cart_item_id)
      item.save
    end
  end
end
