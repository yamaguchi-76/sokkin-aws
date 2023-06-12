# frozen_string_literal: true

# == Schema Information
#
# Table name: proposition_entries
#
#  id                                              :bigint           not null, primary key
#  estimated_work_time(月間希望労働時間(単位hour)) :integer
#  request(ご要望)                                 :text(65535)
#  status(応募の状態)                              :integer          default("pending"), not null
#  created_at                                      :datetime         not null
#  updated_at                                      :datetime         not null
#  proposition_id(案件ID)                          :bigint           not null
#  user_id(応募したユーザーID)                     :bigint           not null
#
# Indexes
#
#  index_proposition_entries_on_proposition_id  (proposition_id)
#  index_proposition_entries_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposition_id => propositions.id)
#  fk_rails_...  (user_id => users.id)
#
class PropositionEntry < ApplicationRecord
  belongs_to :proposition
  belongs_to :user

  # 0: before_interview = 面談前
  # 1: considering = 選考中
  # 2: contracting = 契約中
  # 3: rejected = お見送り
  # 4: disbanded = 解約済み
  enum status: { before_interview: 0, considering: 1, contracting: 2, rejected: 3, disbanded: 4 }

  validates :proposition_id, uniqueness: { scope: :user, message: "に応募済みです。" }

  validates :estimated_work_time, presence: true

  scope :pending, -> { where(status: %i[before_interview considering]) }

  # NOTE: ステータスは一方通行の仕様であるため、選んで更新するような作りにしなかった
  def next_status_label_i18n
    return if rejected? || disbanded?
    return I18n.t!("enums.#{self.model_name.i18n_key}.status.disbanded") if contracting?

    I18n.t!("enums.#{self.model_name.i18n_key}.status.#{next_status_name}")
  end

  def update_next_status!
    raise ActiveRecord::RecordInvalid if rejected? || disbanded?
    next_status = contracting? ? "disbanded" : next_status_name
    update!(status: next_status)

    proposition.contracted!(self) if next_status == "contracting"
  end

  private
    def next_status_name
      sorted_enums = PropositionEntry.statuses.sort_by { |_, v| v }
      sorted_enums[status_before_type_cast.next]&.first
    end
end
