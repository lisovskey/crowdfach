class ResultsController < ApplicationController
  def index
    @results = Project.search_projects params[:query]
  end
end
