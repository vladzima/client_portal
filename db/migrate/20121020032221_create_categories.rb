class CreateCategories < ActiveRecord::Migration
	def change
		create_table :categories do |t|
			t.string :name
			#t.string :varname
			#t.boolean :customer_filetype #differentiate between file types that owner can show versus filetypes that 
			t.text :datastore

			t.timestamps
		end
	end
end
