class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :large_id
      t.integer :division_id

      t.timestamps
    end
  end
end
