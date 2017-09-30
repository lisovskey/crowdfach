class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find params[:id]
    commontator_thread_show @project
    @donation = Donation.new
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find params[:id]
  end

  def create
    @project = Project.new project_params
    @project.avatar = params[:project][:avatar]
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created' }
      else
        flash[:error] = @project.errors.full_messages.first
        format.html { render :new }
      end
    end
  end

  def update
    @project = Project.find params[:id]
    respond_to do |format|
      if @project.update project_params
        format.html { redirect_to @project, notice: 'Project was successfully updated' }
      else
        flash[:error] = @project.errors.full_messages.first      
        format.html { render :edit }
      end
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path, notice: 'Project was successfully deleted'
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :target, :avatar,
        :category_id, :full_description, :expiration_time, :avatar_cache).merge({
          user_id: current_user.id
        })
    end
end
