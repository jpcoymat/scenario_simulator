class AddWeightVolumeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :unit_weight, :decimal, precision: 15, scale: 5 
    add_column :products, :unit_volume, :decimal, precision: 15, scale: 5 
  end
end
