class AddColumnUpdateCountToSelfIntroduction < ActiveRecord::Migration[6.1]
  def change
    add_column :self_introductions, :update_count, :integer, default: 0, null: false
  end
end
