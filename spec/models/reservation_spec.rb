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
end
