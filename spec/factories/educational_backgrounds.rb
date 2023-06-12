# frozen_string_literal: true

# == Schema Information
#
# Table name: educational_backgrounds
#
#  id                                :bigint           not null, primary key
#  faculty_name(学部名)              :string(255)
#  graduated_year(卒業年度)          :date
#  recent_academic_history(最終学歴) :integer          default("masters_graduate"), not null
#  school_name(学校名)               :string(255)      default(""), not null
#  update_count                      :integer          default(0), not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  user_id(ユーザーID)               :bigint           not null
#
# Indexes
#
#  index_educational_backgrounds_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :educational_background do
    recent_academic_history { %i[masters_graduate masters_dropout university_graduate university_dropout junior_college_graduate junior_college_dropout vocational_college_graduate high_school_graduate junior_high_school_graduate others].sample }
    school_name { "test_school_name" }
    faculty_name { "test_faculty_name" }
    graduated_year { Time.current }
    update_count { 0 }
  end
end
