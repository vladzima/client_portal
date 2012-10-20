class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
	  t.string :name
	  t.integer :customer_id
	  t.boolean :internal
      t.text :datastore

      t.timestamps
    end
  end
end
