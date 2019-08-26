class QueriesController < ApplicationController

  # GET /queries
  # GET /queries.json
  def index
    @queries = Query.all
    @counts = Query.joins("INNER JOIN populations ON populations.year = queries.year").distinct.group(:year).count
  end

end
