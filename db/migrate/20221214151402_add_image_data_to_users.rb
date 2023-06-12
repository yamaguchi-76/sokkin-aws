class AddImageDataToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :image_data, :text, comment: 'プロフィール画像'
  end

  def down
    remove_column :users, :image_data
  end
end
