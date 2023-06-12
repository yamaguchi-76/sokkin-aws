class AddColumnDoubleJobExperience < ActiveRecord::Migration[6.1]
  def up
    add_reference :double_job_experiences, :job_kind, null: false, foreign_key: true, comment: '職種'
  end

  def down
    remove_foreign_key :double_job_experiences, :job_kind
    remove_reference :double_job_experiences, :job_kind, index: true
  end
end
