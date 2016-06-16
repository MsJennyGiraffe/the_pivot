class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  has_one :reservation

  validates :user, presence: :true
  validates :status, presence: :true

  def self.from_cart(cart, user: nil)
    new(user: user).tap { |order| order.order_items = cart.to_order_items }
  end

  def completed?
    status == "completed"
  end

  def format_pickup_time
    reservation.pickup_time.strftime("%b %e, %I:%M %p")
  end
end
