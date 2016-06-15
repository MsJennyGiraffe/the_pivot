class SearchController < ApplicationController
  def index
    @items = Item.all
    if Item.search(params[:search]).order("title DESC") == []
      flash[:warning] = "#{params[:search]} not found. How about some: "
      @items = Item.featured_home_items(3)
    else
      @items = Item.search(params[:search]).order("title DESC")
    end
  end

end
