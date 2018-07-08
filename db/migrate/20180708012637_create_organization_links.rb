class CreateOrganizationLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_links do |t|
      t.integer :focal_organization_id
      t.integer :service_organization_id
      t.string :service_function

      t.timestamps
    end
  end
end
