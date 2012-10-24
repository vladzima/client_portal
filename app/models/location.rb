class Location < ActiveRecord::Base
	attr_accessible :customer_id, :store_number, :city, :phone, :state_id, :street, :zipcode
	belongs_to :state
	belongs_to :customer
	has_many :customer_files
	has_many :categories, :through => :customer_files
	
	#validates_uniqueness_of :store_number,  :scope => :customer_id
	validates :store_number, :presence => true, :uniqueness => true
	validates :city, :presence => true
	validates :state_id, :presence => true
	validates :street, :presence => true
	
	def self.getStateLocCountHash(locationArr)
        stateLocCount = Hash.new()
        locationArr.each do |location|
            if stateLocCount.include?(location.state_name) == false
                stateLocCount[location.state_name] = 1
            else
                count = stateLocCount[location.state_name].to_i + 1
                stateLocCount[location.state_name] = count
            end
        end
        return stateLocCount
	end
	
	def state_name
        if self.state.nil? == false
            return self.state.name
        else
            return "N/A"
        end
	end
	
end