class CreateCustomerFiles < ActiveRecord::Migration
  def change
    create_table :customer_files do |t|
      t.string :name
      t.integer :category_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
