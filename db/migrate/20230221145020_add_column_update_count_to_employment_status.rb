class AddColumnUpdateCountToEmploymentStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :employment_statuses, :update_count, :integer, default: 0, null: false
  end
end
