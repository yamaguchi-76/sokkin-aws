# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                        :bigint           not null, primary key
#  birthday(誕生日)          :date
#  email                     :string(255)      default(""), not null
#  encrypted_password        :string(255)      default(""), not null
#  first_name(名前)          :string(255)
#  first_name_kana(名前カナ) :string(255)
#  last_name(名字)           :string(255)
#  last_name_kana(名字カナ)  :string(255)
#  remember_created_at       :datetime
#  reset_password_sent_at    :datetime
#  reset_password_token      :string(255)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { "password" }
  end
end
