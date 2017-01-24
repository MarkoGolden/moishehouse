class ChangeStuffInRents < ActiveRecord::Migration
  def change
    rename_column :rents, :subsidy, :amount
    add_column :rents, :payperiod_id, :integer
  end
end
