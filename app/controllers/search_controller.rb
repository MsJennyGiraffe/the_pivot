class SearchController < ApplicationController
  def index
    @items = Item.all
    if params[:search]
      @items = Item.search(params[:search]).order("title DESC")
    else
      @items = Item.all.order("title DESC")
    end
  end

end
