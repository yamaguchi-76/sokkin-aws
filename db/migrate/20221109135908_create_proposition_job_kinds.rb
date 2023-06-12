class CreatePropositionJobKinds < ActiveRecord::Migration[6.1]
  def change
    create_table :proposition_job_kinds do |t|
      t.references :proposition, null: false, foreign_key: true, comment: '案件ID'
      t.references :job_kind, null: false, foreign_key: true, comment: '職種ID'

      t.timestamps
    end
  end
end
