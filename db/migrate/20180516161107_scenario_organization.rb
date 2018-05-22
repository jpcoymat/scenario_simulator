class ScenarioOrganization < ActiveRecord::Migration[5.2]
  def change
     remove_column :scenarios, :buyer
     remove_column :scenarios, :division_id
     remove_column :scenarios, :seller_id
     remove_column :scenarios, :logistics_provider
     remove_column :scenarios, :carrier
     add_column :scenarios, :enterprise_organization_id, :integer
     add_column :scenarios, :supplier_organization_id, :integer
     add_column :scenarios, :customer_organization_id, :integer
     add_column :scenarios, :carrier_organization_id, :integer
     add_column :scenarios, :logistics_organization_id, :integer
  end
end
