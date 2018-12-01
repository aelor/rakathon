class CreateJourneys < ActiveRecord::Migration[5.2]
  def change
    create_table :journeys do |t|
      t.string :from_lat
      t.string :from_lng
      t.string :to_lat
      t.string :to_lng
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :parking_id

      t.timestamps
    end
  end
end
