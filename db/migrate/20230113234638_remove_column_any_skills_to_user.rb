class RemoveColumnAnySkillsToUser < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :listing_skill
    remove_column :users, :seo_skill
  end

  def down
    add_column :users, :listing_skill, :string, comment: 'xxxスキル'
    add_column :users, :seo_skill, :string, comment: 'SEOスキル'
  end
end
