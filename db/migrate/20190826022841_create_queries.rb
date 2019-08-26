class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.integer :year
      t.string :answer

      t.timestamps
    end
  end
end
