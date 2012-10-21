class AccountSession < Authlogic::Session::Base
    #def to_key
    #       new_record? ? nil : [ self.send(self.class.primary_key) ]
    #end
  
    #def persisted?
    #       false
    #end
    find_by_login_method :find_by_email
end