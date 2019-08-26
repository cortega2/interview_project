class AddTypeToQueries < ActiveRecord::Migration[5.2]
  def change
    add_column :queries, :category, :string
  end
end
