class RemoveColumnDoubleJobExperience < ActiveRecord::Migration[6.1]
  def up
    remove_column :double_job_experiences, :job_kind_category
  end

  def down
    add_column :double_job_experiences, :job_kind_category, :string, comment: '職種'
  end
end
