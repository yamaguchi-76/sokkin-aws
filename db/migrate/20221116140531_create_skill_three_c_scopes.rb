class CreateSkillThreeCScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_three_c_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :three_c_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
