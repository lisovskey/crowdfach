class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:name])
    @projects = Project.where(category_id: @category.id)
  end
end
