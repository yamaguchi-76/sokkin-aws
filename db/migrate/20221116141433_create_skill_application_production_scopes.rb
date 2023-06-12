class CreateSkillApplicationProductionScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_application_production_scopes do |t|
      t.references :skill, index: false, null: false, foreign_key: true
      t.references :application_production_scope, index: false, null: false, foreign_key: true

      t.timestamps
    end
    add_index :skill_application_production_scopes, [:skill_id, :application_production_scope_id], name: 'skill_on_application_production_scopes_index'
  end
end
