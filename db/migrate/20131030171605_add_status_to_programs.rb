class AddStatusToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :status, :string
  end
end
