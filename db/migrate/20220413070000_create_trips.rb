class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|

      t.timestamps
      t.string :location
      t.bigint :amount
      t.string :month
      t.integer :year
      t.string :with
      t.text :notes
    end
  end
end
