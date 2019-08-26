class PopulationsController < ApplicationController
  before_action :check_year
  def index
    if @year
      @population = Population.get(@year)

      # record
      if Population.find_by_year(Date.new(@year.to_i))
        Query.create( {year: @year, answer: @population, category: "exact"} )
      else
        Query.create( {year: @year, answer: @population, category: "calculated"} )
      end
    end
  end

  private
  def check_year
    @year = params[:year]

    if @year && @year.to_i > 2500
      render status: :unprocessable_entity
    end
  end
end
