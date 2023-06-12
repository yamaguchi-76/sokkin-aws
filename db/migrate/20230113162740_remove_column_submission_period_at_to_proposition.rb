class RemoveColumnSubmissionPeriodAtToProposition < ActiveRecord::Migration[6.1]
  def up
    remove_column :propositions, :submission_period_at
  end

  def down
    add_column :propositions, :submission_period_at, :datetime, comment: '応募締め切り'
  end
end
