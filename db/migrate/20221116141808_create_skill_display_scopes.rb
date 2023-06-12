class CreateSkillDisplayScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_display_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :display_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
