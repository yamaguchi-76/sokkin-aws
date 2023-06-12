class CreatePropositionWorkConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :proposition_work_conditions do |t|
      t.references :proposition, null: false, foreign_key: true, comment: '案件ID'
      t.references :work_condition, null: false, foreign_key: true, comment: '勤務条件ID'

      t.timestamps
    end
  end
end
