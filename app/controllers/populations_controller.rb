class PopulationsController < ApplicationController
  before_action :check_year
  def index

    if @year
      @population = Population.get(@year)
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
