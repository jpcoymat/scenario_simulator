class MovementSourceOriginDestination < ActiveRecord::Migration[5.2]
  def change
    rename_column :movement_sources, :location_id, :destination_location_id
    add_column :movement_sources, :origin_location_id, :integer
  end

  
end
