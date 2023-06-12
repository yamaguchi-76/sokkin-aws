class CreateSkillWebsiteScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_website_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :website_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
