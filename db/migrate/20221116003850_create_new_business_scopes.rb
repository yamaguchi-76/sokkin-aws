class CreateNewBusinessScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :new_business_scopes do |t|
      t.string :answer, null: false

      t.timestamps
    end
  end
end
