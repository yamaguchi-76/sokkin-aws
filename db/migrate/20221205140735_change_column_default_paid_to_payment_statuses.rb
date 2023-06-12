class ChangeColumnDefaultPaidToPaymentStatuses < ActiveRecord::Migration[6.1]
  def up
    change_column_default :payment_statuses, :paid, 0
  end

  def down
    change_column_default :payment_statuses, :paid, nil
  end
end
