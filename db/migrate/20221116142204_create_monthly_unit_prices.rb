class CreateMonthlyUnitPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_unit_prices do |t|
      t.integer :unit_price, null: false, comment: "単価"
      t.integer :year, null: false, comment: '年'
      t.integer :month, null: false, comment: "月"
      t.boolean :status, null: false, comment: "アクティブステータス"
      t.references :attendance, null: false, foreign_key: true, comment: '勤怠ID'

      t.timestamps
    end
  end
end
