class CreatePropositionWorkRanges < ActiveRecord::Migration[6.1]
  def change
    create_table :proposition_work_ranges do |t|
      t.references :proposition, null: false, foreign_key: true, comment: '案件ID'
      t.references :work_range, null: false, foreign_key: true, comment: '職域ID'

      t.timestamps
    end
  end
end
