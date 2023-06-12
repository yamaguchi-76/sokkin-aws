class CreateFeedBacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feed_backs do |t|
      t.integer :year, null: false, comment: '年'
      t.integer :month, null: false, comment: '月'
      t.integer :within_time, null: false, comment: '稼働時間内か'
      t.integer :achieved, null: false, comment: '業務遂行度'
      t.integer :communication, null: false, comment: 'パートナーとのコミュニケーション'
      t.integer :partner_skills, null: false, comment: 'パートナーのスキル'
      t.integer :interview, null: false, comment: '面談希望'
      t.text :request, null: false, comment: '要望・相談'
      t.references :attendance, null: false, foreign_key: true, comment: '勤怠ID'

      t.timestamps
    end
  end
end
