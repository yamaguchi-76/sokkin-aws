class AddInvoiceColumnToSelfIntroductions < ActiveRecord::Migration[6.1]
  # NOTE: 自己紹介テーブルにあるべきものではないが、既存のカラムがすべて画面のFormベースで定義されているため合わせる
  def up
    add_column :self_introductions, :registered_invoice, :boolean, default: false, comment: 'インボイス登録有無'
    add_column :self_introductions, :invoice_number, :string, comment: 'インボイス登録番号'
  end

  def down
    remove_column :self_introductions, :registered_invoice
    remove_column :self_introductions, :invoice_number
  end
end
