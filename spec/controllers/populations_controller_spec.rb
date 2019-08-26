require 'rails_helper'

RSpec.describe PopulationsController, type: :controller do
  render_views

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns http success when passing a year" do
      get :index, params: { year: "1900" }
      expect(response).to have_http_status(:success)
    end

    it "returns a population for a date" do
      year = 1900
      get :index, params: { year: year }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to match /Population: #{Population.get(year)}/im
    end

    it "returns 422 error if year is greater than 2500" do
      year = 2501
      get :index, params: { year: year }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
