class Home < ActiveRecord::Base

  def self.search(search)
    where("title ILIKE ?", "%#{search}")
    where("description ILIKE ?", "%#{search}")
  end

end
