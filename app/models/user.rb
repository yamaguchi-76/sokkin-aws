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
class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  # NOTE: 勤怠情報等、長期間必要になりそうなデータが関連するため
  #       一度成約した案件は削除できないようにする
  #       (ユーザー大会は論理削除で実装予定)
  has_many :proposition_contracts, dependent: :restrict_with_exception

  has_many :attendances, dependent: :destroy

  has_one :educational_background, dependent: :destroy
  accepts_nested_attributes_for :educational_background, allow_destroy: true

  has_one :employment_status, dependent: :destroy
  accepts_nested_attributes_for :employment_status, allow_destroy: true
  # validates_associated :employment_status

  has_many :past_employment_statuses, dependent: :destroy
  accepts_nested_attributes_for :past_employment_statuses, allow_destroy: true

  has_one :self_introduction, dependent: :destroy
  accepts_nested_attributes_for :self_introduction, allow_destroy: true

  has_many :double_job_experiences, dependent: :destroy
  accepts_nested_attributes_for :double_job_experiences, allow_destroy: true

  has_many :proposition_entries, dependent: :destroy
  has_many :favorites,  class_name: "UserPropositionFavorite", dependent: :destroy

  has_many :scouts, dependent: :destroy

  has_one :skill, dependent: :destroy

  has_one :bank_account, dependent: :destroy

  enum gender: { male: 0, female: 1, others: 2 }

  validates :agreement, acceptance: { allow_nil: false, on: :create }

  with_options presence: true, on: :update, unless: :encrypted_password_changed? do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :phone_number
    validates :postal_code
    validates :address
    validates :gender
    validates :birthday
  end

  scope :active, -> { where(deleted_at: nil) }

  def initial_setting_completed?
    basic_info_present? &&
      registered_educational_background? &&
      registered_employment_status? &&
      registered_self_introduction? &&
      registered_skill?
  end

  def active?
    deleted_at.nil?
  end

  def ever_updated?
    sign_in_count != 1
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  def favorite?(proposition)
    favorites.exists?(proposition: proposition)
  end

  def soft_delete
    masking_attributes
    delete_related_records
  end

  def active_for_authentication?
    super && !deleted_at
  end

  def inactive_message
    !deleted_at ? super : :deleted_account
  end

  # TODO: 以下helper,decorator層に寄せるリファクタをすること
  def full_name
    "#{last_name} #{first_name}"
  end

  def full_name_kana
    "#{last_name_kana} #{first_name_kana}"
  end

  def age
    return if birthday.nil?

    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  def check_box_label
    "#{id}.#{full_name}"
  end

  private
    def basic_info_present?
      last_name.present? &&
        first_name.present? &&
        last_name_kana.present? &&
        first_name_kana.present? &&
        phone_number.present? &&
        postal_code.present? &&
        address.present? &&
        gender.present? &&
        birthday.present?
    end

    def registered_educational_background?
      educational_background.present? && educational_background.registered?
    end

    def registered_employment_status?
      employment_status.present? && employment_status.registered?
    end

    def registered_self_introduction?
      self_introduction.present? && self_introduction.registered?
    end

    def registered_skill?
      skill.present? && skill.registered?
    end

    def masking_attributes
      update_columns(deleted_at: Time.current,
                     last_name: "退会済みユーザー",
                     first_name: "",
                     last_name_kana: "",
                     first_name_kana: "",
                     gender: nil,
                     phone_number: "",
                     postal_code: "",
                     image: nil,
                     address: "",
                     birthday: Date.new(1800, 1, 1))
    end

    def delete_related_records
      educational_background&.destroy!
      employment_status&.destroy!
      past_employment_statuses.each(&:destroy!)
      self_introduction&.destroy!
      double_job_experiences.each(&:destroy!)
      skill&.destroy!
      bank_account&.destroy!
    end
end
