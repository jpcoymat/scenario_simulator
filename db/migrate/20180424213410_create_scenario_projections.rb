class CreateScenarioProjections < ActiveRecord::Migration[5.2]
  def change
    create_table :scenario_projections do |t|
      t.integer :scenario_id
      t.integer :projection_order
      t.decimal :on_hand_quantity
      t.decimal :supply_forecast_quantity
      t.decimal :on_order_quantity
      t.decimal :in_transit_quantity
      t.decimal :allocated_quantity
      t.decimal :demand_forecast_quantity

      t.timestamps
    end
  end
end
