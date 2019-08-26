class Population < ApplicationRecord

  def self.min_year
    Population.all.map(&:year).min.year
  end

  def self.max_year
    Population.maximum("year").strftime("%Y").to_i
  end

  def self.get(year)
    year = year.to_i

    return 0 if year < min_year
    return Population.expo_growth(year) if year > Population.max_year

    p1 = Population.get_closest(:-, year)   # lo
    p2 = Population.get_closest(:+, year)   # hi

    delta = 0
    if p2[:year] != p1[:year]
      delta = (p2[:population] - p1[:population]) / (p2[:year] - p1[:year])
    end

    pop = p1[:population] + delta * (year - p1[:year])
  end

  private
  def self.get_closest(op, year)
    pop = nil
    until pop
      pop = Population.find_by_year(Date.new(year))

      if !pop
        year = year.send(op, 1)
      end
    end

    return {year: year, population: pop.population}
  end

  def self.expo_growth(year)
    # f(x) = (pop @ max_year) * e^((0.09) * year - max_year)
    rate = 0.09
    y0 = Population.max_year
    p0 = Population.find_by_year(Date.new(y0)).population
    return (p0 * Math.exp(rate * (year - y0))).floor
  end

end
