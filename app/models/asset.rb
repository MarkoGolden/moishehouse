class Asset < ActiveRecord::Base
  attr_accessible :photo
  belongs_to :program
  has_attached_file :photo, 
  	:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  	# :default_url => "/images/:style/missing.png"
  	#:url => "/assets/programs/:program_id/:style/:basename.:extension",
  	#:path => ":rails_root/public/assets/programs/:id/:style/:basename.:extension"
  	:path => "/assets/programs/:id/:style/:basename.:extension"
end
