class AddMhwowAttributesToPrograms < ActiveRecord::Migration
  def change
  	add_column :programs, :time, :string
  	add_column :programs, :expected_attendance, :integer
  	add_column :programs, :buying, :text
  	add_column :programs, :reimbursed, :boolean
  	add_column :programs, :itemized, :boolean
  	add_column :programs, :submit_photos, :boolean
  end
end
