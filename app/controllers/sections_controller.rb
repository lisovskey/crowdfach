class SectionsController < ApplicationController
  def index
    @chosen_projects = pick_projects(:our_choice).last(3)
    @popular_projects = pick_projects(:popular).last(3)
    @last_projects = pick_projects(:recent).last(3)
    @successful_projects = pick_projects(:successful).last(3)
  end

  def show
    @name = params[:name]
    @projects = pick_projects(@name.to_sym)
  end

  private
    def pick_projects(name)
      case name
      when :our_choice then Project.where(chosen: true)
      when :popular then Project.all
      when :recent then Project.all
      when :successful then Project.where(successful: true)
      end.reverse
    end
end
