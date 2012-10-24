class CustomerFile < ActiveRecord::Base
	attr_accessible :category_id, :customer_id, :name, :attachment, :location_id, :customer_id
	#has_one :category
	belongs_to :category
	belongs_to :location
	belongs_to :customer
	
	has_attached_file :attachment
	
	#this is not a sustainable solution... need to accept more file extensions, maybe use an array?
	def isImage?
        if self.attachment_file_name.end_with?('.png') || self.attachment_file_name.end_with?('.jpg')
            return true
        else
            return false
        end
	end
	
	def customer_store
        if self.location.nil? == false
            return self.location.store_number
        else
            return "N/A"
        end
	end
end
