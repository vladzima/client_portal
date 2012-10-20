class User < ActiveRecord::Base
  attr_accessible :customer_id, :datastore, :email, :internal
end
