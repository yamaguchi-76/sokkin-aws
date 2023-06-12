# frozen_string_literal: true

# == Schema Information
#
# Table name: propositions
#
#  id                                                      :bigint           not null, primary key
#  application_deadline(応募締切)                          :datetime
#  background(背景・課題)                                  :text(65535)
#  contract_period(契約期間/単位month)                     :integer
#  estimated_work_time_from(月間想定稼働時間From/単位hour) :integer
#  estimated_work_time_to(月間想定稼働時間To/単位hour)     :integer
#  image(画像)                                             :string(255)
#  ng_point(NG項目)                                        :text(65535)
#  note(備考)                                              :text(65535)
#  operation_start_at(稼働開始時期)                        :datetime
#  required_skill(必須スキル)                              :string(255)
#  status(ステータス)                                      :integer
#  title(案件名)                                           :string(255)
#  unit_price(単価/単位month)                              :integer
#  unit_price_per_hour(時給単価)                           :integer
#  welcome_skill(歓迎スキル)                               :string(255)
#  work_order(依頼業務)                                    :text(65535)
#  created_at                                              :datetime         not null
#  updated_at                                              :datetime         not null
#  company_id(会社、企業ID)                                :bigint           not null
#  industry_id(業界)                                       :bigint           not null
#
# Indexes
#
#  index_propositions_on_company_id   (company_id)
#  index_propositions_on_industry_id  (industry_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (industry_id => industries.id)
#
class Proposition < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :company
  belongs_to :industry

  has_many :proposition_job_kinds
  has_many :job_kinds, through: :proposition_job_kinds, dependent: :destroy

  has_many :proposition_work_ranges
  has_many :work_ranges, through: :proposition_work_ranges, dependent: :destroy

  has_many :proposition_work_conditions
  has_many :work_conditions, through: :proposition_work_conditions, dependent: :destroy

  has_many :proposition_entries, dependent: :destroy
  has_many :favorites,  class_name: "UserPropositionFavorite", dependent: :destroy

  has_many :scouts, dependent: :destroy
  # NOTE: 勤怠情報等、長期間必要になりそうなデータが関連するため
  #       一度成約した案件は削除できないようにする
  has_one :proposition_contract, dependent: :restrict_with_exception

  has_one :attendance

  # 0: wanted = 募集中
  # 1: contracted = 成約済
  # 2: expired = 期限切れ
  # 3: draft = 下書き（toBからの作成は全てdraftになる）
  enum status: { wanted: 0, contracted: 1, expired: 2, draft: 3 }

  scope :entried, ->(user) { left_joins(:proposition_entries).merge(PropositionEntry.where(user: user)) }
  scope :enterable, -> (user) { wanted.where.not(id: entried(user).ids) }
  scope :high_price_order, -> (user) { enterable(user).wanted.order(unit_price: :desc).limit(10) }
  scope :new_order, -> (user) { enterable(user).wanted.order(created_at: :desc).limit(10) }
  scope :scoutable, -> (user, company) {
    exclude_ids = Scout.scouted_proposition_ids(user: user, company: company)

    wanted
      .where(company: company)
      .where.not(id: exclude_ids)
  }
  scope :deadline_after_today, -> { where(application_deadline: Time.now.beginning_of_day..) }

  with_options presence: true do
    validates :title
    validates :estimated_work_time_from
    validates :estimated_work_time_to
    validates :operation_start_at
    validates :contract_period
    validates :background
    validates :required_skill
    validates :welcome_skill
    validates :work_order
    validates :application_deadline
    validates :unit_price
    validates :unit_price_per_hour
    validates :industry_id
  end

  def formatted_contract_period
    "#{contract_period}ヶ月～"
  end

  def formatted_unit_price
    "#{unit_price}万円/月"
  end

  def contracted!(entry)
    raise ArgumentError if entry.blank?
    update!(status: :contracted)
    other_entries = proposition_entries.where.not(id: entry.id)
    # TODO: PropositionEntryにstatus関連のバリデーションが増えるならbulk updateをやめること
    other_entries.update_all(status: :rejected)
    contract_user = entry.user
    create_proposition_contract!(user: contract_user)
    create_attendance!(user: contract_user)
  end
end
