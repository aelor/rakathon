class AddLatLongInOwners < ActiveRecord::Migration[5.2]
  def change
  	add_column :owners, :latitude, :string
    add_column :owners, :longitude, :string
  end
end
