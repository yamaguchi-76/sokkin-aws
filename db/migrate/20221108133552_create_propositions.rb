class CreatePropositions < ActiveRecord::Migration[6.1]
  def change
    create_table :propositions do |t|
      t.references :company, null: false, foreign_key: true, comment: '会社、企業ID'
      t.string :title, comment: '案件名'
      t.integer :status, comment: 'ステータス'
      t.text :detail, comment: '???'
      t.integer :amount, comment: '???'
      t.integer :estimated_work_time_from, comment: '月間想定稼働時間From/単位hour'
      t.integer :estimated_work_time_to, comment: '月間想定稼働時間To/単位hour'
      t.datetime :operation_start_at, comment: '稼働開始時期'
      t.integer :contract_period, comment: '契約期間/単位month'
      t.string :environment, comment: '???'
      t.string :industry, comment: '???'
      t.text :background, comment: '背景・課題'
      t.string :required_skill, comment: '必須スキル'
      t.string :welcome_skill, comment: '歓迎スキル'
      t.text :work_order, comment: '依頼業務'
      t.text :ng_point, comment: 'NG項目'
      t.datetime :submission_period_at, comment: '応募締め切り'
      t.text :note, comment: '備考'

      t.timestamps
    end
  end
end
