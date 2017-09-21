class ResultsController < ApplicationController
  def index
    @results = Project.search_everywhere params[:query]
	end
end
