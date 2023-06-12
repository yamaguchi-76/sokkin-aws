class CreateEmploymentStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :employment_statuses do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'

      t.integer :status, null: false, default: 0, comment: '就業形態'
      t.string :company_name, null: false, default: "", comment: '会社名'
      t.string :industry_category, null: false, default: "", comment: '業種'
      t.string :job_kind_category, null: false, default: "", comment: '職種'
      t.string :job_title, comment: '役職'
      t.integer :yearly_income, null: false, default: 0, comment: '年収'
      t.integer :working_hours, null: false, default: 0, comment: '稼働日/週'
      t.integer :working_days_of_the_week, null: false, default: 0, comment: '稼働時間/日'
      t.text :business_experience, comment: '経験業務内容'
      t.date :employment_start_date, comment: '就業開始年月'
      t.date :employment_end_date, comment: '就業終了年月'
      t.boolean :in_employment, comment: '現在の就業状況'

      t.timestamps
    end
  end
end
