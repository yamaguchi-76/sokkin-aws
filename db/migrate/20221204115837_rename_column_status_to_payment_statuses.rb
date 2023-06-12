class RenameColumnStatusToPaymentStatuses < ActiveRecord::Migration[6.1]
  def up
    rename_column :payment_statuses, :status, :paid
    change_column :payment_statuses, :paid, :integer
  end

  def down
    change_column :payment_statuses, :paid, :boolean
    rename_column :payment_statuses, :paid, :status
  end
end
