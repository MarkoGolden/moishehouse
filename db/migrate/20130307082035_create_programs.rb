class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.integer :program_type_id
      t.boolean :partnership
      t.date :date
      t.integer :attended_total
      t.integer :attended_residents
      t.integer :attended_new

      t.timestamps
    end
  end
end
