class CreateSkillFourPScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_four_p_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :four_p_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
