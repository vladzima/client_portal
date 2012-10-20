class CreateCustomerFiles < ActiveRecord::Migration
  def change
    create_table :customer_files do |t|
      t.string :name
	  t.string :description
      t.integer :category_id
      t.integer :customer_id
	  t.integer :location_id
	  
	  #paperclip stuff
	  t.string :attachment_file_name
	  t.string :attachment_content_type
	  t.integer :attachment_file_size
	  t.datetime :attachment_updated_at
	  
      t.timestamps
    end
  end
end
