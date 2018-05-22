class AddOrderClassesToOrgs < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :supply_order_class, :string
    add_column :organizations, :demand_order_class, :string
  end
end
