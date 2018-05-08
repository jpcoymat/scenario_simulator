class CreateScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
      t.integer :product_id
      t.integer :location_id
      t.string :name
      t.string :buyer
      t.string :division_id
      t.string :seller_id
      t.string :logistics_provider
      t.string :carrier
      t.timestamps
    end
  end
end
