class AddProductOrderReferenceToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :product_order, foreign_key: true
  end
end
