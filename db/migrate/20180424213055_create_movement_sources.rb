class CreateMovementSources < ActiveRecord::Migration[5.2]
  def change
    create_table :movement_sources do |t|
      t.string :reference_number
      t.string :type
      t.date :eta
      t.date :etd
      t.integer :product_id
      t.integer :location_id
      t.decimal :quantity
      t.decimal :original_quantity

      t.timestamps
    end
  end
end
