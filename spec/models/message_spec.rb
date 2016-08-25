require 'rails_helper'

RSpec.describe Message, type: :model do

    describe "message validates associations" do
      it { should belong_to(:user) }
      it { should belong_to(:chat_room) }
    end

    describe "message validates attributes" do
      it { should validate_presence_of(:body) }
    end
  end

    RSpec.describe "message should create timestamp" do
      it "creates a message with a timestamp" do
      message = Message.create(body: "hello!")

      time = message.timestamp

      expect(time).to include Time.new.year.to_s
    end
  end
