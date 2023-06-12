class CreateSkillEcsiteScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_ecsite_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :ecsite_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
