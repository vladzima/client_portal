class CustomerFile < ActiveRecord::Base
	attr_accessible :category_id, :customer_id, :name, :attachment, :location_id, :customer_id
	has_one :category
	has_one :location
	belongs_to :customer
	
	has_attached_file :attachment
end
