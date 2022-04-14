class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|

      t.timestamps
      t.string :name
      t.bigint :amount
      t.string :month
      t.integer :year
      t.boolean :income, default: false
    end
  end
end
