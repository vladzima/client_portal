class State < ActiveRecord::Base
	attr_accessible :abbr, :name
	has_many :locations
	
    validates :name, :uniqueness => true, :presense => true
    validates :abbr, :uniqueness => true, :presense => true
end
