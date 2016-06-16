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
    result = Reservation.generate_date_range

    start = DateTime.now.beginning_of_day + 10.hour + 1.day 
    
    expect(result).to include(start)
    expect(result.length).to eq(6)
  end
end
