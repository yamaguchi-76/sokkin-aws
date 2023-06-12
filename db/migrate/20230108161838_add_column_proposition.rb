class AddColumnProposition < ActiveRecord::Migration[6.1]
  def up
    add_reference :propositions, :industry, null: false, foreign_key: true, comment: '業界'
  end

  def down
    remove_foreign_key :propositions, :industry
    remove_reference :propositions, :industry, index: true
  end
end
