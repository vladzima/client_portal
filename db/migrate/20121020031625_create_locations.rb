class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      #t.string :name
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
  end
end
