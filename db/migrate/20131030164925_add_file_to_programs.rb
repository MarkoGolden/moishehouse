class AddFileToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :file, :string
  end
end
