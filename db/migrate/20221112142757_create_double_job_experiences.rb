class CreateDoubleJobExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :double_job_experiences do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'

      t.string "company_name", default: "", null: false, comment: '会社名'
      t.string "job_kind_category", default: "", null: false, comment: '職種'
      t.integer "monthly_income", default: 0, null: false, comment: '月収'
      t.integer "working_hours", comment: '稼働時間'
      t.date "employment_start_date", comment: '複業開始年月'
      t.date "employment_end_date", comment: '複業時の就業終了年月'
      t.text "business_experience", comment: '業務内容'

      t.timestamps
    end
  end
end
