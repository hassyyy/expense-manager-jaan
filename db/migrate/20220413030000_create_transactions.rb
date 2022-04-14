class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|

      t.timestamps
      t.string :name
      t.bigint :amount
      t.string :month
      t.integer :year
      t.integer :credit_card_id
    end
  end
end
