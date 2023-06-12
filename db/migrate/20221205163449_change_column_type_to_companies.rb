class ChangeColumnTypeToCompanies < ActiveRecord::Migration[6.1]
  def up
    change_column :companies, :phone_number, :string, comment: '電話番号'
  end

  def down
    change_column :companies, :phone_number, :integer, comment: '電話番号'
  end
end
