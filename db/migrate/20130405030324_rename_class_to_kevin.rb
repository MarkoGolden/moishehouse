class RenameClassToKevin < ActiveRecord::Migration
  def change
    rename_column :receipts, :class, :kevin
  end
end
