class AddOrgsToMs < ActiveRecord::Migration[5.2]
  def change
    add_column :movement_sources, :enterprise_organization_id, :integer
    add_column :movement_sources, :supplier_organization_id, :integer
    add_column :movement_sources, :customer_organization_id, :integer
    add_column :movement_sources, :carrier_organization_id, :integer
    add_column :movement_sources, :logistics_organization_id, :integer
  end
end
