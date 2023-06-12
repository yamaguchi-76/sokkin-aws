class RemoveColumnsCompanies < ActiveRecord::Migration[6.1]
  # NOTE: 旧リポジトリからmigrationファイルを持ってきた際に存在していたカラム
  #       何のためのカラムか不明瞭だったためで使い道も無さそうなので削除する
  def up
    remove_column :companies, :business_details
    remove_column :companies, :employees
    remove_column :companies, :status
  end

  def down
    add_column :companies, :business_details, :text, comment: '事業内容'
    add_column :companies, :employees, :integer, comment: '従業員数'
    add_column :companies, :status, :integer, comment: 'ステータス'
  end
end
