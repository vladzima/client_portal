class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
	  t:string :name
      t.text :datastore
      t.integer :customer_id
      t.boolean :internal

      t.timestamps
    end
  end
end
