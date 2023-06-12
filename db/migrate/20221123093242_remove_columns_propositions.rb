class RemoveColumnsPropositions < ActiveRecord::Migration[6.1]
  # NOTE: 旧リポジトリからmigrationファイルを持ってきた際に存在していたカラム
  #       何のためのカラムか不明瞭だったためcommentに ??? を入れておいたが
  #       使い道も無さそうなので削除する
  def up
    remove_column :propositions, :detail
    remove_column :propositions, :amount
    remove_column :propositions, :environment
    remove_column :propositions, :industry
  end

  def down
    add_column :propositions, :detail, :text, comment: '???'
    add_column :propositions, :amount, :integer, comment: '???'
    add_column :propositions, :environment, :string, comment: '???'
    add_column :propositions, :industry, :string, comment: '???'
  end
end
