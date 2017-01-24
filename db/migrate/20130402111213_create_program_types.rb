class CreateProgramTypes < ActiveRecord::Migration
  def change
    create_table :program_types do |t|
      t.string :name
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
