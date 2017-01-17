class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :day
      t.time :start
      t.time :end
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
