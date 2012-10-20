class CustomerFile < ActiveRecord::Base
	attr_accessible :category_id, :customer_id, :name
	has_one :category
	
	has_attached_file :attachment
end
