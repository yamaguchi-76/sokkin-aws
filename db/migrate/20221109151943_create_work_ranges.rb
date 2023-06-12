class CreateWorkRanges < ActiveRecord::Migration[6.1]
  def change
    create_table :work_ranges do |t|
      t.string :name, null: false, comment: '職域名'
      t.integer :display_sort, null: false, index: { unique: true }, comment: '表示順'

      t.timestamps
    end
  end
end
