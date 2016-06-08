class Item < ActiveRecord::Base
  belongs_to :category
  has_attached_file :avatar
    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"}
  # validates :avatar,
  #     attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
  #     attachment_size: { less_than: 5.megabytes }

  # has_attached_file :avatar, styles: {
  #   thumb: '100x100>',
  #   square: '200x200#',
  #   medium: '300x300'
  # }
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



  def self.search(search)
    query = "%#{search}%"
    self.where("title ILIKE ? or description ILIKE ?", query, query)
  end
end
