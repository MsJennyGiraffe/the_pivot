class User < ActiveRecord::Base
  has_secure_password

  after_create :set_default_role
  validates_presence_of :slug
  before_validation :generate_slug

  has_many :orders
  has_many :items
  has_many :bids

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: [:default, :seller, :platform_admin]

  def set_default_role
    self.update(role: 0 ) unless self.role
  end

  def update_role
    if self.role == "platform_admin"
      self.update_attributes(approved: true, requested: false)
      UserNotifier.approved_seller(self).deliver_now
    else
      self.update_attributes(approved: true, role: 1, requested: false)
      UserNotifier.approved_seller(self).deliver_now
    end
  end

  def name
    email.split('@')[0]
  end


  private

  def generate_slug
    self.slug = username.parameterize
  end

end
