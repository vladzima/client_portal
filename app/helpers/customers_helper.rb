module CustomersHelper
        
    def getStateLocCountHash
        @stateLocCount = Hash.new()
        locationArr.each do |location|
            if @stateLocCount.include?(location.state.name) == false
                @stateLocCount[location.state.name] = 1
            else
                count = @stateLocCount[location.state.name].to_i + 1
                @stateLocCount[location.state.name] = count
            end
        end
        return stateLocCount
    end
end
