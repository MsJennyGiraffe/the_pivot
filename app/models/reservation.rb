class Reservation < ActiveRecord::Base
  include ReservationHelper

  belongs_to :order

  validates :order, presence: true
  validates :pickup_time, presence: true

  def self.generate_available_dates
    ReservationHelper.all_dates.select do |time|
      !ReservationHelper.booked_times.include?(time)
    end
  end

  def self.get_booked_times
    ReservationHelper.booked_times
  end

  def self.get_all_dates
    ReservationHelper.all_dates
  end
end
