class State < ActiveRecord::Base
	attr_accessible :abbr, :name
	has_many :locations
end
