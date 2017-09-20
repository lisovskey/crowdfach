class SectionsController < ApplicationController
  def index
    @chosen_projects = Project.last(3).reverse
    @popular_projects = @chosen_projects
    @last_projects = @chosen_projects
    @successful_projects = Project.where(successful: true).last(3).reverse
  end

  def show(projects, name)
    @name = name
    @projects = projects
  end
end
