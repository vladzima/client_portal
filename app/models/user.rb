class User < ActiveRecord::Base
	attr_accessible :customer_id, :email, :internal
	has_one :customer
  
	def self.public_cols
		[:email, :name]
	end
	
end
