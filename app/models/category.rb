class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :customer_files
  
  validates :name, :uniqueness => true, :presence => true
end
