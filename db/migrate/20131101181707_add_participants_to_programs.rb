class AddParticipantsToPrograms < ActiveRecord::Migration
  def change
  	#remove_column :programs, :participant_id, :integer
    add_column :programs, :participants, :text
  end
end
