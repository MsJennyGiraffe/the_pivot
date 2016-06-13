class HomeController < ApplicationController
  def index
    @items = Item.featured_home_items(3)
  end
end
