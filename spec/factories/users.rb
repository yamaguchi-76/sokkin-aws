# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  address(住所)                       :string(255)
#  birthday(誕生日)                    :date
#  confirmation_sent_at                :datetime
#  confirmation_token                  :string(255)
#  confirmed_at                        :datetime
#  current_sign_in_at                  :datetime
#  current_sign_in_ip                  :string(255)
#  deleted_at                          :datetime
#  email                               :string(255)      default(""), not null
#  encrypted_password                  :string(255)      default(""), not null
#  first_name(名前)                    :string(255)
#  first_name_kana(名前カナ)           :string(255)
#  gender(性別)                        :integer
#  image(プロフィール画像)             :string(255)
#  last_name(名字)                     :string(255)
#  last_name_kana(名字カナ)            :string(255)
#  last_sign_in_at                     :datetime
#  last_sign_in_ip                     :string(255)
#  phone_number(電話番号)              :string(255)
#  postal_code(郵便番号)               :string(255)
#  remember_created_at                 :datetime
#  reset_password_sent_at              :datetime
#  reset_password_token                :string(255)
#  second_job_experience(複業経験有無) :boolean          default(FALSE)
#  sign_in_count                       :integer          default(0), not null
#  unconfirmed_email                   :string(255)
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    agreement { true }
    confirmed_at { Time.current }

    sequence(:first_name) { |n| "太郎#{n}" }
    first_name_kana { "たろう" }
    last_name { "ノベル" }
    last_name_kana { "のべる" }

    birthday { Time.current }
    phone_number { "0000-00-0000" }
    postal_code { 1234567 }
    address { %w[北海道 東京 沖縄].sample }
    gender { [0, 1].sample }

    trait :with_has_one_records do
      after(:create) do |user|
        create(:educational_background, user: user)
        create(:employment_status, user: user)
        create(:self_introduction, user: user)
      end
    end

    trait :with_skill do
      after(:create) do |user|
        create(:skill, user: user)
      end
    end

    trait :all_nil do
      first_name { nil }
      first_name_kana { nil }
      last_name { nil }
      last_name_kana { nil }

      birthday { nil }
      phone_number { nil }
      postal_code { nil }
      address { nil }
      gender { nil }
    end
  end
end
