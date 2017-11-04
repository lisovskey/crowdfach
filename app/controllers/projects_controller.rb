class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = current_user.projects
  end

  def show
    commontator_thread_show @project
    @donation = Donation.new
  end

  def new
  end

  def edit
  end

  def create
    @project.avatar = params[:project][:avatar]
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: t('.success') }
      else
        flash[:error] = @project.errors.full_messages.first
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update project_params
        format.html { redirect_to @project, notice: t('.success') }
      else
        flash[:error] = @project.errors.full_messages.first      
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: t('.success')
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :target, :avatar, :avatar_cache,
                                      :category_id, :full_description, :expiration_time,
                                      rewards_attributes: [:description, :price]).merge({
          user_id: current_user.id
        })
    end
end
