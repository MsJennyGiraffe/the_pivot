class Reservation < ActiveRecord::Base
  belongs_to :order

  validates :order, presence: true
  validates :pickup_time, presence: true
  # validates :order, ->(order) { order.completed? }
end
