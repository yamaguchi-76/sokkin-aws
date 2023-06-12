class CreateSearchScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :search_scopes do |t|
      t.string :answer, null: false

      t.timestamps
    end
  end
end
