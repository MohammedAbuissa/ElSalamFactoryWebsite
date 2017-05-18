class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
    	t.belongs_to :user, foreign_key: true
    	t.date :shipping_date, null: false
      	t.timestamps
    end
  end
end
