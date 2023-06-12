class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'

      t.string :bank_name, comment: '金融機関'
      t.string :branch_name, comment: '支店名'
      t.integer :account_kind, comment: '口座種別'
      t.string :account_number, comment: '口座番号'
      t.string :account_holder, comment: '口座名義'

      t.timestamps
    end
  end
end
