class Reservation < ActiveRecord::Base
  belongs_to :order

  validates :order, presence: true
  validates :pickup_time, presence: true

  def self.generate_date_range
    time_range = (DateTime.now.beginning_of_day + 10.hour + 1.day .. DateTime.now.beginning_of_day + 15.hour + 1.day)
    result = []
    current_time = time_range.first
    until current_time == time_range.last + 1.hour
      result << current_time
      current_time = current_time.advance(hours: 1)
    end
    result
  end

end
