class AddProductProductOrderReference < ActiveRecord::Migration[5.1]
  def change
  	add_reference :product_orders, :product, foreign_key: true
  end
end
