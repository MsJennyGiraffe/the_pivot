class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :bids

  validates :title, presence: true
  validates :description, presence: true
  validates :image_path, presence: true

  before_save :set_expiration
  after_update :check_bid_status

  enum bid_status: %w(Open Closed)

  def self.search(search)
    query = "%#{search}%"
    self.where("title ILIKE ? or description ILIKE ?", query, query)
  end

  def self.featured_home_items(quantity)
    Item.order("RANDOM()").limit(quantity)
  end

  def set_expiration
    if self.expiration_time.nil?
      self.expiration_time = Time.now + 24.hours
    end
  end

  def check_bid_status
      self.bid_status = 1 if self.expiration_time < Time.now

  end

end
