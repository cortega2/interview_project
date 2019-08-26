require 'rails_helper'

RSpec.describe Population, type: :model do

  describe 'max_year' do
    it "it should return the larges year in the database" do
      # the 1990 comes from the seeds file, in the future we might want to
      # insert a known max year to test against
      expect(Population.max_year).to eq(1990)
    end
  end

  describe 'get' do
    it "should accept a year we know and return the correct population" do
      expect(Population.get(1900)).to eq(76212168)
      expect(Population.get(1990)).to eq(248709873)
    end

    it "should accept a year we don't know and return the previous known population" do
      expect(Population.get(1902)).to eq(79415432)
      expect(Population.get(1908)).to eq(89025224)
    end

    it "should accept a year that is before earliest known and return zero" do
      expect(Population.get(1800)).to eq(0)
      expect(Population.get(0)).to eq(0)
      expect(Population.get(-1000)).to eq(0)
    end

    it "should accept a year that is after latest known and return an aproximation based on exp growth" do
      expect(Population.get(2000)).to eq(611727577)
    end
  end
end
