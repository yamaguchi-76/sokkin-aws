class ChangeColumnDefaultPaidFrom0ToNilToPaymentStatuses < ActiveRecord::Migration[6.1]
  def up
    change_column_default :payment_statuses, :paid, 2
  end

  def down
    change_column_default :payment_statuses, :paid, 0
  end
end
