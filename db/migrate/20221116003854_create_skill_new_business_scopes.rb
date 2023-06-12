class CreateSkillNewBusinessScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_new_business_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :new_business_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
