class ProgramPhoto < ActiveRecord::Base
  attr_accessible :program_id, :asset, :assets, :program_photo
  belongs_to :program
	has_many :assets
  
	# validates_attachment_presence :photo
	# validates_attachment_size :photo, :less_than => 5.megabytes
end
