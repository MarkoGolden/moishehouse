class AddGalleryToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :gallery_id, :integer
  end
end
