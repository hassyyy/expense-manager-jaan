class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|

      t.timestamps
      t.string :name
      t.integer :credit_card_id
      t.bigint :amount
      t.integer :tenure
      t.date :start_date
    end
  end
end
