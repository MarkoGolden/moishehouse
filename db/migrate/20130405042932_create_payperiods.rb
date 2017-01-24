class CreatePayperiods < ActiveRecord::Migration
  def change
    create_table :payperiods do |t|
      t.date :date
      t.boolean :locked
      t.boolean :locked_rent

      t.timestamps
    end
  end
end
