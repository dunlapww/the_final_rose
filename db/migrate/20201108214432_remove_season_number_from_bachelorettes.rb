class RemoveSeasonNumberFromBachelorettes < ActiveRecord::Migration[5.2]
  def change
    remove_column :bachelorettes, :season_number, :integer
  end
end
