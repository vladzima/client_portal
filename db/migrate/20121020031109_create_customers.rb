class CreateCustomers < ActiveRecord::Migration
	def change
		create_table :customers do |t|
			t.string :name
			t.text :datastore

			t.timestamps
		end
	end
end
