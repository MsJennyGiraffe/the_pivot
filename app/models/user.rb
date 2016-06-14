class User < ActiveRecord::Base
  has_secure_password

  after_create :set_default_role

  has_many :orders

  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true

  enum role: [:default, :admin]

  def set_default_role
    self.update(role: 0) unless self.role 
  end
end
