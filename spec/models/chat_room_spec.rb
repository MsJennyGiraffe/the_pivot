require 'rails_helper'

RSpec.describe ChatRoom, type: :model do

  describe "chatroom validates associations" do
    it { should belong_to(:user) }
    it { should have_many(:messages) }
  end
end
