class User < ActiveRecord::Base
  has_secure_password

  after_create :set_default_role
  validates_presence_of :slug
  before_validation :generate_slug

  has_many :orders
  has_many :items
  has_many :bids

  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true

  enum role: [:default, :seller, :platform_admin]

  def set_default_role
    self.update(role: 0 ) unless self.role
  end

  def update_role
    if self.role == "platform_admin"
      self.update_attributes(approved: true, requested: false)
    else
      self.update_attributes(approved: true, role: 1, requested: false)
    end
  end


  private

  def generate_slug
    self.slug = username.parameterize
  end

end
