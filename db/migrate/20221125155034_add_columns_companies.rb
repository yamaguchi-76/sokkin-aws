class AddColumnsCompanies < ActiveRecord::Migration[6.1]
  def up
    add_column :companies, :homepage, :text, comment: 'ホームページ', after: :name_kana
    add_column :companies, :postal_code, :string, comment: '郵便番号', after: :name_kana
    add_column :companies, :address, :string, comment: '住所', after: :name_kana
    add_column :companies, :belonging_department, :string, comment: '所属部署', after: :name_kana
    add_column :companies, :person_in_charge_last_name, :string, comment: '担当者名 性', after: :name_kana
    add_column :companies, :person_in_charge_first_name, :string, comment: '担当者名 名', after: :name_kana
    add_column :companies, :person_in_charge_last_name_kana, :string, comment: '担当者名 性カナ', after: :name_kana
    add_column :companies, :person_in_charge_first_name_kana, :string, comment: '担当者名 名カナ', after: :name_kana
    add_column :companies, :phone_number, :integer, comment: '電話番号', after: :name_kana
  end

  def down
    remove_column :companies, :homepage
    remove_column :companies, :postal_code
    remove_column :companies, :address
    remove_column :companies, :belonging_department
    remove_column :companies, :person_in_charge_last_name
    remove_column :companies, :person_in_charge_first_name
    remove_column :companies, :person_in_charge_last_name_kana
    remove_column :companies, :person_in_charge_first_name_kana
    remove_column :companies, :phone_number
  end
end
