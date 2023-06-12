class CreateJobKinds < ActiveRecord::Migration[6.1]
  def change
    create_table :job_kinds do |t|
      t.string :name, null: false, comment: '職種名'
      t.integer :display_sort, null: false, index: { unique: true }, comment: '表示順'

      t.timestamps
    end
  end
end
