class CreateSnsOwnedMediaScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :sns_owned_media_scopes do |t|
      t.string :answer, null: false

      t.timestamps
    end
  end
end
