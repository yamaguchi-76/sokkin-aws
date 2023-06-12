class AddColumnEmploymentStatus < ActiveRecord::Migration[6.1]

  def up
    add_reference :employment_statuses, :job_kind, null: false, foreign_key: true, comment: '職種'
  end

  def down
    remove_foreign_key :employment_statuses, :job_kind
    remove_reference :employment_statuses, :job_kind, index: true
  end
end
