class User < ActiveRecord::Base
	#attr_accessible :customer_id, :email, :internal
	has_one :customer
	
	attr_accessor :password_confirmation
    attr_reader   :password
	
	acts_as_authentic do |c|
        c.validate_login_field = false
    end # block optional
  
	def deliver_password_reset_instructions!  
        reset_perishable_token!  
        #UserMailer.password_reset_instructions(self).deliver
	end
	
	private

    def password_must_be_present
        errors.add(:password, "Missing password") unless password.present?
    end
	
end
