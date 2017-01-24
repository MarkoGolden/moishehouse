class Purpose < ActiveRecord::Base
  attr_accessible :id, :active, :description, :name
  has_many :receipts
end
