class CreateEducationalBackgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :educational_backgrounds do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'

      t.integer :recent_academic_history, null: false, default: 0, comment: '最終学歴'
      t.string :school_name, null: false, default: "", comment: '学校名'
      t.string :faculty_name, comment: '学部名'
      t.date :graduated_year, comment: '卒業年度'
      t.timestamps
    end
  end
end
