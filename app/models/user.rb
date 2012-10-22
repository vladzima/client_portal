class User < ActiveRecord::Base
	attr_accessible :email, :customer_id, :internal
	has_one :customer
	
	attr_accessor :password_confirmation
    attr_reader   :password
    
    before_validation :create_user_sans_password, :on => :create
	
	acts_as_authentic do |c|
        c.validate_login_field = false
        
        #external = Proc.new { |r| r.externally_authenticated? }

        #c.merge_validates_confirmation_of_password_field_options(:unless => external)
        #c.merge_validates_length_of_password_confirmation_field_options(:unless => external)
        #c.merge_validates_length_of_password_field_options(:unless => external)
    end # block optional

	def deliver_password_reset_instructions!  
        reset_perishable_token!  
        #UserMailer.password_reset_instructions(self).deliver
	end
	
	private

    def password_must_be_present
        errors.add(:password, "Missing password") unless password.present?
    end
    
    def create_user_sans_password
        if self.password.nil? == true
            self.randomize_password
        end
    end
	
end
