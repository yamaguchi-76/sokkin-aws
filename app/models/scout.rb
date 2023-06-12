# frozen_string_literal: true

# == Schema Information
#
# Table name: scouts
#
#  id                                :bigint           not null, primary key
#  scout_from(スカウトを出したModel) :integer          not null
#  status(ステータス)                :integer          not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  proposition_id(案件ID)            :bigint           not null
#  user_id(ユーザーID)               :bigint           not null
#
# Indexes
#
#  index_scouts_on_proposition_id  (proposition_id)
#  index_scouts_on_user_id         (user_id)
#
class Scout < ApplicationRecord
  belongs_to :user
  belongs_to :proposition

  # 0: 検討中（スカウト中）, 1: 応募済み, 2: 興味なし
  enum status: { consider: 0, entried: 1, not_interested: 2 }
  # 0: admin, 1: toB
  enum scout_from: { admin: 0, company: 1 }

  validates :user_id, uniqueness: { scope: :proposition_id }

  class << self
    def scouted_proposition_ids(user:, company:)
      joins(:proposition)
        .where(user_id: user.id)
        .merge(Proposition.where(company: company))
        .pluck(:proposition_id)
    end

    def send_scout(proposition_id:, user_id:, from:)
      scout_instance = Scout.new(proposition_id: proposition_id,
                                 user_id: user_id,
                                 status: :consider,
                                 scout_from: from)

      if scout_instance.save
        ScoutMailer.scout(scout_instance).deliver
      end
    end
  end
end
