class AddColumnUpdateCountToEducationalBackground < ActiveRecord::Migration[6.1]
  def change
    add_column :educational_backgrounds, :update_count, :integer, default: 0, null: false
  end
end
