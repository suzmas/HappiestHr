class AddLatitudeToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :latitude, :float
  end
end
