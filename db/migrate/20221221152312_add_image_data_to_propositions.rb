class AddImageDataToPropositions < ActiveRecord::Migration[6.1]
  def up
    add_column :propositions, :image_data, :text, comment: '画像'
  end

  def down
    remove_column :propositions, :image_data
  end
end
