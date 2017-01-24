class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :receipts, :program_id
  	add_index :receipts, :submitter_id
  end
end
