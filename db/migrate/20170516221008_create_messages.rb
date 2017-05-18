class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
    	t.belongs_to :product_order, foreign_key: true
    	t.belongs_to :user, foreign_key: true
    	t.string :msg_txt, :null => false
      	t.timestamps
    end
  end
end
