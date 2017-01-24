class RemoveParticipantsFromPrograms < ActiveRecord::Migration
	def change
		remove_column :programs, :participants
	end
end
