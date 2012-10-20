class CreateCustomers < ActiveRecord::Migration
	def change
		create_table :customers do |t|
			t.string :name
			t.integer :customer_id
			t.text :datastore

			t.timestamps
		end
	end
end
