class CreateLocations < ActiveRecord::Migration
    def change
        create_table :locations do |t|
            t.string :store_number
            t.string :street
            t.string :city
            t.integer :state_id
            t.string :zipcode
            t.string :phone
            t.integer :customer_id
            t.text :datastore

            t.timestamps
        end
        
        #add_index :locations [:customer_id, :state_id]
    end
end
