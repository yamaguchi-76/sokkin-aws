class ChangeColumnFromShrineToCarrierwave < ActiveRecord::Migration[6.1]
  def up
    remove_column :propositions, :image_data
    add_column :propositions, :image, :string, comment: '画像'

    remove_column :users, :image_data
    add_column :users, :image, :string, comment: 'プロフィール画像'
  end

  def down
    remove_column :propositions, :image
    add_column :propositions, :image_data, :text, comment: '画像'

    remove_column :users, :image
    add_column :users, :image_data, :text, comment: 'プロフィール画像'
  end
end
