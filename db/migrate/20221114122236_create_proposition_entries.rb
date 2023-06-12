class CreatePropositionEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :proposition_entries do |t|
      t.references :proposition, null: false, foreign_key: true, comment: '案件ID'
      t.references :user, null: false, foreign_key: true, comment: '応募したユーザーID'

      t.integer :status, null: false, default: 0, comment: '応募の状態'
      t.integer :estimated_work_time, comment: '月間希望労働時間(単位hour)'
      t.text :request, comment: 'ご要望'
      t.timestamps
    end
  end
end
