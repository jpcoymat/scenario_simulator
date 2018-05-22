class RenameModeMs < ActiveRecord::Migration[5.2]
  def change
    rename_column :movement_sources, :transportation_movement_id, :transportation_mode_id
  end
end
