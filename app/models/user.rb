class User < ActiveRecord::Base
  has_secure_password

  after_create :set_default_role

  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true

  def set_default_role
    self.update(role: 0) unless self.role 
  end
end
