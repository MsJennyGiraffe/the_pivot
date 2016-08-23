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

  def active?
    active
  end

  def self.less_than_starting_bid(item, params)

    item.starting_bid < params[:starting_bid].to_f
  end

  def self.update_bid(item,params)
    item.update_attribute(:starting_bid, params[:starting_bid])
  end

  def self.create_bid(item,params,current_user)
    Bid.create(price: params[:starting_bid], user: current_user, item: item)
  end

  def self.check_bid(item,params,current_user,flash)
    if current_user && Item.less_than_starting_bid(item, params)
      Item.update_bid(item, params)
      flash[:success] = "Placed succesful bid!"
      Item.create_bid(item, params,current_user)
      1
    elsif current_user
      flash[:warning] = "Must make a bid that is higher than current bid."
    else
      flash[:warning] = "Login to Bid"
    end
  end

end
