class CreateSkillTagManagerScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_tag_manager_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :tag_manager_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
