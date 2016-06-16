require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:reservation_instance) { build(:reservation) }

  it "has a valid factory" do
    expect(reservation_instance).to respond_to(:order)
    expect(reservation_instance).to respond_to(:pickup_time)
  end

  it "reservation validates attributes" do
    expect(reservation_instance).to validate_presence_of(:order)
    expect(reservation_instance).to validate_presence_of(:pickup_time)
  end

  it "can generate correct time range" do
    result = Reservation.generate_available_dates

    start = DateTime.now.beginning_of_day + 10.hour + 1.day

    expect(result).to include(start)
    expect(result.length).to eq(6)
  end

  it "can find all booked times in the database" do
    create(:reservation)
    time = DateTime.now.beginning_of_day + 10.hour + 1.day
    expect(Reservation.all.length).to eq(1)
    expect(Reservation.get_booked_times.length).to eq(1)
    expect(Reservation.get_booked_times.last).to eq(time)
    expect(Reservation.get_all_dates.length).to eq(6)
  end
end
