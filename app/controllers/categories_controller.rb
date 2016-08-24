class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:name])
  end
end
