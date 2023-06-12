class AddColumnUpdateCountToSkill < ActiveRecord::Migration[6.1]
  def change
    add_column :skills, :update_count, :integer, default: 0, null: false
  end
end
