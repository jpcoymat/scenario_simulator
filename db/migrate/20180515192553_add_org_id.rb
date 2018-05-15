class AddOrgId < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :organization_id, :integer
    add_column :locations, :organization_id, :integer
  end
end
