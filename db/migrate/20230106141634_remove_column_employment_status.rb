class RemoveColumnEmploymentStatus < ActiveRecord::Migration[6.1]
  def up
    remove_column :employment_statuses, :job_kind_category
  end

  def down
    add_column :employment_statuses, :job_kind_category, :string, comment: '職種'
  end
end
