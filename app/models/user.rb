class User < ActiveRecord::Base
  attr_accessible :customer_id, :datastore, :email, :internal
  has_one :customer
end
