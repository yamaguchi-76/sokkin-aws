class CreateSelfIntroductions < ActiveRecord::Migration[6.1]
  def change
    create_table :self_introductions do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'

      t.text :self_pr, comment: '自己PR'
      t.integer :desired_unit_price, null: false, default: 0, comment: '希望単価'
      t.integer :desired_working_hours, null: false, default: 0, comment: '希望稼働時間'
      t.integer :desired_working_days, null: false, default: 0, comment: '希望勤務日数'
      t.integer :in_person_meeting, null: false, default: 0, comment: '対面ミーティング'
      t.integer :handle_status, null: false, default: 0, comment: '対応ステータス'
      t.integer :handle_conditions, null: false, default: 0, comment: '対応条件'
      t.string :portfolio, comment: 'ポートフォリオ'

      t.timestamps
    end
  end
end
