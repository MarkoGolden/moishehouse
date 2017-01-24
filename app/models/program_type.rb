class ProgramType < ActiveRecord::Base
  attr_accessible :id, :active, :description, :name
  
  has_many :programs
end
