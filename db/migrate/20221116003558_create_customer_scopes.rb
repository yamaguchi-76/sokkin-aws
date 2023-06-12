class CreateCustomerScopes < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_scopes do |t|
      t.string :answer, null: false

      t.timestamps
    end
  end
end
