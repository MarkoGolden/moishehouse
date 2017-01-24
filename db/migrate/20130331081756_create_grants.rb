class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string :name
      t.decimal :amount
      t.text :description
      t.datetime :expires

      t.timestamps
    end
  end
end
