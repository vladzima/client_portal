class State < ActiveRecord::Base
	attr_accessible :abbr, :name
	has_many :locations
	
    validates :name, :uniqueness => true, :presence => true
    validates :abbr, :uniqueness => true, :presence => true
end
