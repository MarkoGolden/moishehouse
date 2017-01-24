class Granttype < ActiveRecord::Base
  attr_accessible :id, :active, :description, :name

  has_many :grants

end
