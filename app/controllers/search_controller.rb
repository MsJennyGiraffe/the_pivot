class SearchController < ApplicationController
  def index
    @items = Item.all
    if Item.search(params[:search]).order("title DESC") == []
      flash[:warning] = "#{params[:search]} not found."
    else
      @items = Item.search(params[:search]).order("title DESC")
    end
  end
end
