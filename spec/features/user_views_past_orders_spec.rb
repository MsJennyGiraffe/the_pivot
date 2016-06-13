require 'rails_helper'

RSpec.feature "user views past orders" do
  let(:order_instance_1) { create(:order) }
  let(:order_instance_2) { create(:order) }

  scenario "authenticated user views past orders" do
    user = order_instance_1.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)
    visit "/orders"
  end
end
