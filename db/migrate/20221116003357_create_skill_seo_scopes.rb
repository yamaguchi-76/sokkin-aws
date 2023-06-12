class CreateSkillSeoScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_seo_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :seo_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
