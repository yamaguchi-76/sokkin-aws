class CreateIndustries < ActiveRecord::Migration[6.1]
  def change
    create_table :industries do |t|
      t.references :industry_group, null: false
      t.string :name, null: false, comment: '業界名'
      t.integer :display_sort, null: false, comment: '表示順'

      t.timestamps
    end
  end
end
