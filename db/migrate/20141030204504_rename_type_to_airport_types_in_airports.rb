class RenameTypeToAirportTypesInAirports < ActiveRecord::Migration
  def change
    rename_column :airports, :type, :airport_type
  end
end
