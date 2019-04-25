class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.date :date
      t.text :description
      t.string :location
      t.string :hotel
      t.text :schedule
      t.text :transportation

      t.timestamps
    end
  end
end
