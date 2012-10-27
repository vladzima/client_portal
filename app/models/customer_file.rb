class CustomerFile < ActiveRecord::Base
	attr_accessible :category_id, :customer_id, :name, :attachment, :location_id, :customer_id, :delete_upload

	belongs_to :category
	belongs_to :location
	belongs_to :customer
	
	has_attached_file :attachment
	
	attr_accessor :delete_upload
    before_save :destroy_upload?
	
	#this is not a sustainable solution... need to accept more file extensions, maybe use an array?
	def isImage?
        if self.attachment_file_name.nil?
			return false
		elsif self.attachment_file_name.downcase.end_with?('.png') || self.attachment_file_name.downcase.end_with?('.jpg') ||
            self.attachment_file_name.downcase.end_with?('.jpeg') || self.attachment_file_name.downcase.end_with?('.gif') ||
            self.attachment_file_name.downcase.end_with?('.bmp') || self.attachment_file_name.downcase.end_with?('.tiff')
			return true
        else
            return false
        end
	end
	
	def isPDF?
        if self.attachment_file_name.downcase.end_with?('.pdf')
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
	
	def category_name
        if self.category.nil? == false
            return self.category.name
        else
            return "undefined"
        end
	end
	
	def self.getCustomerFileCategoryHash(fileArr)
        categoryHash = Hash.new()
        fileArr.each do |file|
            if categoryHash.include?(file.category_name) == false
                categoryHash[file.category_name] = 1
            else
                count = categoryHash[file.category_name].to_i + 1
                categoryHash[file.category_name] = count
            end
        end
        return categoryHash
	end
	
	private
	
    def destroy_upload?
        self.attachment.clear if @delete_upload == "1"
    end
	
end
