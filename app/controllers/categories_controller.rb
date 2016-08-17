class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:name])
  end

  def index
    @categories = Category.joins(:items).uniq
  end
end
