class AddLotsToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :event_type_id, :integer
    add_column :programs, :completed_date, :datetime
    add_column :programs, :photo_updated_date, :datetime
    add_column :programs, :admin_notes, :text
    add_column :programs, :partner, :string
    add_column :programs, :submitter_id, :integer
    add_column :programs, :submitted_date, :datetime
    add_column :programs, :direct_service, :boolean
    add_column :programs, :mhwow, :boolean
    add_column :programs, :kevin, :string
  end
end
