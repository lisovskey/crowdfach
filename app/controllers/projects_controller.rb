class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path }
      else
        format.html { render :new }
      end
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :target,
        :category, :full_description).merge({
          user_id: current_user.id
        })
    end
end
