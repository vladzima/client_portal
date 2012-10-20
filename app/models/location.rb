class Location < ActiveRecord::Base
	attr_accessible :city, :datastore, :name, :phone, :state_id, :street, :zipcode
	has_one :state_id
	belongs_to :customer
end
