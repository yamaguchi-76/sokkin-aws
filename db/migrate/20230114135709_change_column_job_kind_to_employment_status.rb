class ChangeColumnJobKindToEmploymentStatus < ActiveRecord::Migration[6.1]
  def up
    remove_reference :employment_statuses, :job_kind, index: true
    add_reference :employment_statuses, :job_kind, null: true, comment: '職種'
  end

  def down
    remove_reference :employment_statuses, :job_kind, index: true
    add_reference :employment_statuses, :job_kind, null: false, comment: '職種'
  end
end
