module CustomersHelper
        
    def getStateLocationCountHash(locationArr)
        stateLocCount = Hash.new()
        locationArr.each do |location|
            if stateLocCount.includes(location.state.name)
                stateLocCount[location.state.name] = 1
            else
                stateLocCount[location.state.name] = stateLocCount[location.state.name]+1
            end
        end
        return stateLocCount
    end    
end
