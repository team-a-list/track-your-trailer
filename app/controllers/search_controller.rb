class SearchController < ApplicationController

  def index
    @results = RottenTomatoesApi.seed_search(params[:q])
  end

end
