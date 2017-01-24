class AddAttachmentPhotoToProgramPhotos < ActiveRecord::Migration
  def self.up
    change_table :program_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :program_photos, :photo
  end
end
