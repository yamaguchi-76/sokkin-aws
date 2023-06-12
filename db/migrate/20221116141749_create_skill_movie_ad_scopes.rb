class CreateSkillMovieAdScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_movie_ad_scopes do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :movie_ad_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
