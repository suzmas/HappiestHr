class AddLongitudeToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :longitude, :float
  end
end
