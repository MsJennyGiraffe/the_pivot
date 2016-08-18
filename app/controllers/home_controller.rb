class HomeController < ApplicationController
  def index
    @items = Item.featured_home_items(4)
  end
end
