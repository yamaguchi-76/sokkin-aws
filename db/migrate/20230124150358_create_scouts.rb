class CreateScouts < ActiveRecord::Migration[6.1]
  def change
    create_table :scouts do |t|
      t.references :user, null: false, comment: 'ユーザーID'
      t.references :proposition, null: false, comment: '案件ID'

      t.integer :status, null: false, comment: 'ステータス'
      t.integer :scout_from, null: false, comment: 'スカウトを出したModel'
      t.timestamps
    end
  end
end
