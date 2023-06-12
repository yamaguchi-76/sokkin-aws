class AddDefaultToSkills < ActiveRecord::Migration[6.1]
  def up
    change_column_default :skills, :planner, false
    change_column_default :skills, :media_consultant, false
    change_column_default :skills, :operation_operator, false
    change_column_default :skills, :designer, false
    change_column_default :skills, :director, false
    change_column_default :skills, :engineer, false
  end

  def down
    change_column_default :skills, :planner, nil
    change_column_default :skills, :media_consultant, nil
    change_column_default :skills, :operation_operator, nil
    change_column_default :skills, :designer, nil
    change_column_default :skills, :director, nil
    change_column_default :skills, :engineer, nil
  end
end
