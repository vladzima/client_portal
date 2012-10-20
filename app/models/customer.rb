class Customer < ActiveRecord::Base
	attr_accessible :name
	has_many :users
	has_many :locations
end
