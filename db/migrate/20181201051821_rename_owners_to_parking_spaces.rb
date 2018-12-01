class RenameOwnersToParkingSpaces < ActiveRecord::Migration[5.2]
  def change
   rename_table :parking_spaces, :parking_spaces
  end
end
