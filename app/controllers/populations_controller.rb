class PopulationsController < ApplicationController
  def index
    @year = params[:year]
    if @year
      @population = Population.get(@year)
    end
  end
end
