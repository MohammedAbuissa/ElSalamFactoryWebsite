class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    		t.string :name, :limit => 100, :null => false
    		t.text :description, :null => true
    		t.decimal :price, :null => false
    		t.integer :quantity, :null => false
    		t.string :specification_path, :null => false
	      	t.timestamps
    end
  end
end
