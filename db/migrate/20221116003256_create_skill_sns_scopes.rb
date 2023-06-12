class CreateSkillSnsScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_sns_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :sns_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
