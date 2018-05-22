class ChageLargeIntDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :organizations, :large_id, :string
  end
end
