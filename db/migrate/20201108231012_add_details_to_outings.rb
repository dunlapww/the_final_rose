class AddDetailsToOutings < ActiveRecord::Migration[5.2]
  def change
    add_column :outings, :location, :string
    add_column :outings, :date, :date
  end
end
