class QueriesController < ApplicationController

  # GET /queries
  # GET /queries.json
  def index
    @queries = Query.all
  end

end
