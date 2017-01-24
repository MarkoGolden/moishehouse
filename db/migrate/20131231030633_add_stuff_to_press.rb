class AddStuffToPress < ActiveRecord::Migration
  def change
    add_column :presses, :title, :string
    add_column :presses, :publication, :string
    add_column :presses, :url, :string
    add_column :presses, :firstpara, :text
    add_column :presses, :date, :date
  end
end
