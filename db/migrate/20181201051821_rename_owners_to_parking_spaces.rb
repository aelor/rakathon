class RenameOwnersToParkingSpaces < ActiveRecord::Migration[5.2]
  def change
   rename_table :owners, :parking_spaces
  end
end
