class CreateSkillDspScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_dsp_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :dsp_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
