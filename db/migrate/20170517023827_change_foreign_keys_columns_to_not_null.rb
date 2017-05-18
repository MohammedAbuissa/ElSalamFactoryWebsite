class ChangeForeignKeysColumnsToNotNull < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :product_orders, :user_id, false
  	change_column_null :product_orders, :product_id, false
  	change_column_null :messages, :user_id, false
  	change_column_null :messages, :product_order_id, false
  end
end
