class Photo < ActiveRecord::Base
  # attr_accessible :image, :name
  attr_accessible :gallery_id, :image
  belongs_to :gallery
  mount_uploader :image, ImageUploader


  # belongs_to :attachable, :polymorphic => true

  # has_attached_file :photo,
		# 					  		:styles => {
		# 					      :thumb=> "100x100#",
		# 					      :small  => "300x300>",
		# 					      :large => "600x600>"
		# 					      }



  # def to_jq_upload
  #   {
  #     "name" => read_attribute(:image),
  #     "size" => image.size,
  #     "url" => image.url,
  #     "thumbnail_url" => image.thumb.url,
  #     "delete_url" => picture_path(:id => id),
  #     "delete_type" => "DELETE" 
  #   }
  # end
  # validates :image_path, presence: true

  # mount_uploader :image, ImageUploader
  #has_attached_file :photos, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
