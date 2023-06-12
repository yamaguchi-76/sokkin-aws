class CreateSkillCustomerJourneyScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_customer_journey_scopes do |t|
      t.references :skill, index: false, null: false, foreign_key: true
      t.references :customer_journey_scope, index: false, null: false, foreign_key: true

      t.timestamps
    end
    add_index :skill_customer_journey_scopes, [:skill_id, :customer_journey_scope_id], name: 'skill_on_customer_journey_scopes_index'
  end
end
