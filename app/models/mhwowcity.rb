class Mhwowcity < ActiveRecord::Base
  attr_accessible :id, :location 
  has_many :programs
end
