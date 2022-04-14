class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances do |t|

      t.timestamps
      t.string :name
      t.bigint :amount
    end
  end
end
