class SectionsController < ApplicationController
  def index
    @chosen_projects = pick_projects(:our_choice).first(helpers.row_size)
    @popular_projects = pick_projects(:popular).first(helpers.row_size)
    @last_projects = pick_projects(:recent).first(helpers.row_size)
    @successful_projects = pick_projects(:successful).first(helpers.row_size)
  end

  def show
    @name = params[:name]
    @projects = pick_projects(@name.to_sym)
  end

  private
    def pick_projects(name)
      case name
      when :our_choice then Project.where.not(chosen_at: nil).order(:chosen_at)
      when :popular then Project.all
      when :recent then Project.all
      when :successful then Project.where(successful: true)
      end.reverse
    end
end
