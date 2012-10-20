class Location < ActiveRecord::Base
  attr_accessible :city, :datastore, :name, :phone, :state_id, :street, :zipcode
end
