class SectionsController < ApplicationController
  def index
    @chosen_projects = pick_last_projects(:our_choice)
    @popular_projects = pick_last_projects(:popular)
    @last_projects = pick_last_projects(:recent)
    @successful_projects = pick_last_projects(:successful)
  end

  def show
    @name = params[:name]
    @projects = pick_projects(@name.to_sym).reverse
  end

  private
    def pick_last_projects(name)
      pick_projects(name).last(helpers.row_size).reverse
    end

    def pick_projects(name)
      case name
      when :our_choice then Project.where.not(chosen_at: nil).order(:chosen_at)
      when :popular then Project.all
      when :recent then Project.all
      when :successful then Project.where(successful: true)
      end.includes(:user)
    end
end
