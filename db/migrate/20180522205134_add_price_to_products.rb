class AddPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :unit_price, :decimal, precision: 10, scale: 2 
  end
end
