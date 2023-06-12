class CreateWorkConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :work_conditions do |t|
      t.string :name, null: false, comment: '勤務条件名'
      t.integer :display_sort, null: false, index: { unique: true }, comment: '表示順'

      t.timestamps
    end
  end
end
