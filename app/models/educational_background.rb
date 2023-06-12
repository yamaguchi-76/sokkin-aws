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
class EducationalBackground < ApplicationRecord
  belongs_to :user

  enum recent_academic_history: {
    masters_graduate: 0,
    masters_dropout: 1,
    university_graduate: 2,
    university_dropout: 3,
    junior_college_graduate: 4,
    junior_college_dropout: 5,
    vocational_college_graduate: 6,
    high_school_graduate: 7,
    junior_high_school_graduate: 8,
    others: 9
  }

  with_options presence: true, on: :update do
    validates :school_name
    validates :graduated_year
    validates :recent_academic_history
    validates :faculty_name
  end

  def ever_updated?
    created_at != updated_at
  end

  def registered?
    update_count != 0
  end
end
