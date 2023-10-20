class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_id, unique: true
      t.string :merchant_id, nil: false
      t.string :user_id, nil: false
      t.string :card_number, nil: false
      t.datetime :transaction_date, nil: false
      t.float :transaction_amount, nil:false
      t.string :device_id, nil: false
      t.boolean :has_cbk, default: false

      t.index :transaction_id, unique: true
    end
  end
end
