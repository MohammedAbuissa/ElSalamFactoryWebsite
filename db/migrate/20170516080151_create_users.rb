class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :email, :limit => 100, :null => false
    	t.string :password, :limit => 100, :null => false
    	t.string :name, :limit => 50, :null => false 
    	t.string :shipping_address, :null => false
      	t.timestamps
    end
  end
end
