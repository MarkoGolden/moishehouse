class AddProgPhotosToPrograms < ActiveRecord::Migration
  def change
  	add_column :programs, :program_photos, :string
  end
end
