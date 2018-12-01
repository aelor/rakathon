class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :price
      t.integer :payment_id

      t.timestamps
    end
  end
end
