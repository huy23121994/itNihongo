class CreateUsers < ActiveRecord::Migration
  	def change
    	create_table :users do |t|
    		t.string :username
    		t.string :password_digest
    		t.string :email
    		t.integer :role, default: 0
	  		t.string :fullname
  			t.string :address
    	end
  	end
end
