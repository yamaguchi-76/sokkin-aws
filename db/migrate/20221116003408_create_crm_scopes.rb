class CreateCrmScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :crm_scopes do |t|
      t.string :answer, null: false

      t.timestamps
    end
  end
end
