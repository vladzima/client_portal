class User < ActiveRecord::Base
	attr_accessible :email, :customer_id, :internal, :admin #internal and admin really should be a private variable -> we can change that later
	belongs_to :customer
	
	attr_accessor :password_confirmation
    attr_reader   :password
    
    #attr_accessor :password 
    #attr_accessible :password, :password_confirmation
    
    before_validation :create_user_sans_password, :on => :create
    before_save :set_internal_vals
	
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
	
	def customer_name
        if self.customer.nil? == false
            return self.customer.name
        elsif self.internal == true
            return "Best Neon"
        else
            return "N/A"
        end
	end
	
    def isAdmin?
        if self.admin == true
            return true
        else
            return false
        end
    end
    
    def set_internal_vals
        if self.customer_id.nil? == false
            self.internal = true
        end
        
        if self.internal == false
            self.admin = false
        end
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
