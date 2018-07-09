class ChangeServiceTypeDatatype < ActiveRecord::Migration[5.2]
  def change
    remove_column :organization_links, :service_function
    add_column :organization_links, :service_function, :integer
  end
end
