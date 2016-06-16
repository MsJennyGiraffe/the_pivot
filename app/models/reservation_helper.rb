module ReservationHelper
  def self.all_dates
    start = DateTime.now.beginning_of_day + 10.hour + 1.day
    stop = DateTime.now.beginning_of_day + 15.hour + 1.day
    time_range = start..stop
    result = []
    current_time = time_range.first
    until current_time == time_range.last + 1.hour
      result << current_time
      current_time = current_time.advance(hours: 1)
    end
    result
  end

  def self.booked_times
    Reservation.pluck(:pickup_time)
  end
end
