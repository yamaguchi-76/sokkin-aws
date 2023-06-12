# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id                                                :bigint           not null, primary key
#  address(住所)                                     :string(255)
#  belonging_department(所属部署)                    :string(255)
#  email                                             :string(255)      default(""), not null
#  encrypted_password                                :string(255)      default(""), not null
#  homepage(ホームページ)                            :text(65535)
#  name(企業名)                                      :string(255)
#  name_kana(企業名カナ)                             :string(255)
#  person_in_charge_first_name(担当者名 名)          :string(255)
#  person_in_charge_first_name_kana(担当者名 名カナ) :string(255)
#  person_in_charge_last_name(担当者名 性)           :string(255)
#  person_in_charge_last_name_kana(担当者名 性カナ)  :string(255)
#  phone_number(電話番号)                            :integer
#  postal_code(郵便番号)                             :string(255)
#  remember_created_at                               :datetime
#  reset_password_sent_at                            :datetime
#  reset_password_token                              :string(255)
#  created_at                                        :datetime         not null
#  updated_at                                        :datetime         not null
#
# Indexes
#
#  index_companies_on_email                 (email) UNIQUE
#  index_companies_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :company do
    sequence(:email) { |n| "company#{n}@example.com" }
    password { "password" }
    name { "テスト企業名" }
    name_kana { "テストキギョウメイカナ" }
    person_in_charge_last_name { "担当者 性" }
    person_in_charge_first_name { "担当者 名" }
    person_in_charge_last_name_kana { "セイ" }
    person_in_charge_first_name_kana { "メイ" }
    homepage { "homepageURL" }
    belonging_department { "test部署" }
    phone_number { "0123-456-789" }
    address { "東京都千代田区丸の内１丁目" }
    postal_code { "100-0005" }
  end
end
