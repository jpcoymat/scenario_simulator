class CreateTransportationModes < ActiveRecord::Migration[5.2]
  def change
    create_table :transportation_modes do |t|
      t.string :mode_description
      t.string :mode_code

      t.timestamps
    end
  end
end
