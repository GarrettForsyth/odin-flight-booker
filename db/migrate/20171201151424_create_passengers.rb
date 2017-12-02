class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.boolean :has_ticket

      t.timestamps
    end
  end
end
