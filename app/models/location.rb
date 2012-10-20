class Location < ActiveRecord::Base
	attr_accessible :city, :name, :phone, :state_id, :street, :zipcode
	belongs_to :state
	belongs_to :customer
end
