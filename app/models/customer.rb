class Customer < ActiveRecord::Base
	attr_accessible :name
	has_many :users
	has_many :locations
	
	has_attached_file :attachment

	validates :name, :uniqueness => true, :presence => true
end
