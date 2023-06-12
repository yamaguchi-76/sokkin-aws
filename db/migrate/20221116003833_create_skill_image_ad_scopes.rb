class CreateSkillImageAdScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_image_ad_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :image_ad_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
