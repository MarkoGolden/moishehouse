class AddNameToProgramPhotos < ActiveRecord::Migration
  def change
  	add_column :program_photos, :name, :string
  end
end
