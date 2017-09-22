class UsersController < ApplicationController
  before_action :authenticate_user!

  def projects
    @projects = current_user.projects
  end

  def show
    @user = User.find(params[:id])
  end
end
