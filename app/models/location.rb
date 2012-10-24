class Location < ActiveRecord::Base
	attr_accessible :customer_id, :store_number, :city, :phone, :state_id, :street, :zipcode
	belongs_to :state
	belongs_to :customer
	
	validates_uniqueness_of :store_number,  :scope => :customer_id
	
	def self.getStateLocCountHash(locationArr)
        stateLocCount = Hash.new()
        locationArr.each do |location|
            if stateLocCount.include?(location.state.name) == false
                stateLocCount[location.state.name] = 1
            else
                count = stateLocCount[location.state.name].to_i + 1
                stateLocCount[location.state.name] = count
            end
        end
        return stateLocCount
	end
	
end