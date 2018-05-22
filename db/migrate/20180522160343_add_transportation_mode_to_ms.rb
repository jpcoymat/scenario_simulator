class AddTransportationModeToMs < ActiveRecord::Migration[5.2]
  def change
    add_column :movement_sources, :transportation_movement_id, :integer
  end
end
