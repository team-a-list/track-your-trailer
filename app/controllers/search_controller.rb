class SearchController < ApplicationController


  def new
    #this will be the new search form
  end

  def index
    @results = RottenTomatoesApi.seed_search(params[:q])
    #this will be redirected from "create"
    #@results = ids of the params
    #take in some query string params
    #call the methods we just wrote, assigning to an instance variable
    #stay in index
  end

end
