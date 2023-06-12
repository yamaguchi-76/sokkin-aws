class CreatePropositionContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :proposition_contracts do |t|
      t.references :proposition, null: false, foreign_key: true, comment: '案件ID'
      t.references :user, null: false, foreign_key: true, comment: '成約したユーザーID'

      t.timestamps
    end
  end
end
