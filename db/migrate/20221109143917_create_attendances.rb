class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.references :proposition, null: false, foreign_key: true, comment: '案件ID'
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'

      t.timestamps
    end
  end
end
