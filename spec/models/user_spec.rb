require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_instance) { build(:user) }

  it "has a valid factory" do
    expect(user_instance).to be_valid
    expect(user_instance).to respond_to(:username)
    expect(user_instance).to respond_to(:password_digest)
    expect(user_instance).to have_secure_password
    expect(user_instance).to respond_to(:email)
    expect(user_instance).to respond_to(:role)
  end

  describe "user validates attributes" do
    it { expect(user_instance).to validate_presence_of(:username) }
    it { expect(user_instance).to validate_presence_of(:password_digest) }
    it { expect(user_instance).to validate_presence_of(:email) }
  end
end
