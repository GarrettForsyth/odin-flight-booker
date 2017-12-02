class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :from_airport, foreign_key: true
      t.references :to_airport, foreign_key: true
      t.datetime :departure_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
