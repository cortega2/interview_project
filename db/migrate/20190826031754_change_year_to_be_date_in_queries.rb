class ChangeYearToBeDateInQueries < ActiveRecord::Migration[5.2]
  def change
  change_column :queries, :year, :date
  end
end
