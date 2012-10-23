class Category < ActiveRecord::Base
  attr_accessible :datastore, :name
  has_many :customer_files
end
