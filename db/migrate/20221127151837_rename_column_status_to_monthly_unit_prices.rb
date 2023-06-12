class RenameColumnStatusToMonthlyUnitPrices < ActiveRecord::Migration[6.1]
  def change
    rename_column :monthly_unit_prices, :status, :active
  end
end
