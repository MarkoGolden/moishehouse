class Program < ActiveRecord::Base
  attr_accessible :attended_new, :attended_residents, :attended_total, :date, :description, :name, :partnership, :program_type_id, :partner,
  								:time, :expected_attendance, :buying, :reimbursed, :itemized, :submit_photos, :submitter_id, :attachments_attributes, 
                  :attachments, :attachable, :file, :status, :mhwowcity_id, :photos_attributes, :image, :gallery_id, :photos, :house_id, 
                  :direct_service, :program_photos_attributes, :id, :photo, :delete_photo, :program_photos, :avatar, :participants, :assets, :assets_attributes
  attr_accessor :photo_file_name

  belongs_to :user, :foreign_key => :submitter_id
  belongs_to :house
  belongs_to :program_type
  belongs_to :gallery
  has_one :location
  has_many :assets
  has_many :receipts
  accepts_nested_attributes_for :assets
  validates_presence_of :date, :description, :name, :house_id, :program_type_id
  before_create :default_name
  # has_attached_file :photo, :styles => {:thumb => '120x120>', :large => '640x480>' },
  #                   :default_style => :thumb,
  #                   :url => "/images/:class/:id/:style/:basename.:extension"
  #accepts_nested_attributes_for :program_photos, :allow_destroy => true
  
  # has_many :photos, :dependent => :destroy
  # accepts_nested_attributes_for :photos, :allow_destroy => true
  # validates_presence_of :date  

  def assets_array=(array)
    puts "->>>>>>>>>> Huh?"
    puts array
    array.each do |file|
      #begin
        self.assets.build(:photo => file.last["photo"])
      #rescue
      #end
    end
  end

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end

  def check_status
    if self.status == "Submitted"
      return "1"
    elsif self.status == "Approved"
      return "2"
    elsif self.status == "Declined"
      return "3"
    else
      return self.status
    end
  end
      

  def date_and_name
  	"#{date}" + " - #{name}"
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |program|
        csv << program.attributes.values_at(*column_name)
      end
    end
  end  

  # def photos
  # 	if self.avatar.to_s == "missing.png"
  # 		"http://moishehouse.org/data/photos/events/#{self.id}/#{self.photo.id}.jpg"
  # 	end
  # end
end
