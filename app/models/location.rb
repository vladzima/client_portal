class Location < ActiveRecord::Base
	attr_accessible :customer_id, :store_number, :city, :phone, :state_id, :street, :zipcode
	belongs_to :state
	belongs_to :customer
end
