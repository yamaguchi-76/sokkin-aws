class CreatePaymentStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_statuses do |t|
      t.integer :year, null: false, comment: '年'
      t.integer :month, null: false, comment: "月"
      t.boolean :status, null: false, comment: "支払いステータス"
      t.references :attendance, null: false, foreign_key: true, comment: '勤怠ID'

      t.timestamps
    end
  end
end
