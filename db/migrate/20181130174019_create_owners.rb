class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.text :address
      t.string :mobile
      t.string :no_of_parking
      t.string :price

      t.timestamps
    end
  end
end
