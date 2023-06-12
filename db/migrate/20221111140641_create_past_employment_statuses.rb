class CreatePastEmploymentStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :past_employment_statuses do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'

      t.string :company_name, null: false, default: '', comment: '会社名'
      t.string :previous_client_or_industry, null: false, default: '', comment: '担当顧客や業種'
      t.date :employment_start_date, comment: '就業開始年月'
      t.date :employment_end_date, comment: '就業終了年月'

      t.timestamps
    end
  end
end
