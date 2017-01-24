class AddParticipantsToProgramsAgain < ActiveRecord::Migration
  def change
  	add_column :programs, :participants, :text
  end
end
