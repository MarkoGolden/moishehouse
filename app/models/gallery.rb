class Gallery < ActiveRecord::Base
	attr_accessible :photos_attributes, :image, :photo
	has_many :photos, :dependent => :destroy
	accepts_nested_attributes_for :photos
  
end
