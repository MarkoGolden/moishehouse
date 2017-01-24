class CreateProgramPhotos < ActiveRecord::Migration
  def change
    create_table :program_photos do |t|
      t.integer :program_id
      t.belongs_to :programs

      t.timestamps
    end
  end
end
