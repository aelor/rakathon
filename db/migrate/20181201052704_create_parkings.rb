class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.integer :user_id
      t.integer :parking_space_id
      t.datetime :in_time
      t.datetime :out_time
      t.integer :payment_id
      t.string :status

      t.timestamps
    end
  end
end
