class CreateOperatingTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :operating_times do |t|
      t.integer :working_month, null: false, comment: '稼働月'
      t.date :working_days, null: false, comment: '稼働日'
      t.integer :working_hours, null: false, comment: '稼働時間'
      t.string :job_description, comment: '業務内容'
      t.boolean :status, null: false, default: false, comment: '提出ステータス'
      t.references :attendance, null: false, foreign_key: true, comment: '勤怠ID'

      t.timestamps
    end
  end
end
