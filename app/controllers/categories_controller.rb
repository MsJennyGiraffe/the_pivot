class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:category_title])
  end

end
