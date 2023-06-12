class CreateSkillUserSurveyScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_user_survey_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :user_survey_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
