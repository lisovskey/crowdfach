class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @last_projects = Project.last(3).reverse
  end

  def show
    @project = Project.find(params[:id])
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
        print @project.errors.full_messages
        format.html { render :new }
      end
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :target,
        :category_id, :full_description, :expiration_time).merge({
          user_id: current_user.id
        })
    end
end
