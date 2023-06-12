class RenameColumnStatusToOperatingTimes < ActiveRecord::Migration[6.1]
  def change
    rename_column :operating_times, :status, :submitted
  end
end
