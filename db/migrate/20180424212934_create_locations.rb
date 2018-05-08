class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :code
      t.string :name
      t.string :address
      t.string :city
      t.string :state_providence
      t.string :postal_code
      t.string :country
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
