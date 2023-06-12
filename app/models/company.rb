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
class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :name_kana
    validates :homepage
    validates :postal_code
    validates :address
    validates :belonging_department
    validates :person_in_charge_first_name
    validates :person_in_charge_first_name_kana
    validates :person_in_charge_last_name
    validates :person_in_charge_last_name_kana
    validates :phone_number
  end

  has_many :propositions, dependent: :destroy

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

  def person_in_charge_full_name
    "#{person_in_charge_last_name} #{person_in_charge_first_name}"
  end

  def person_in_charge_full_name_kana
    "#{person_in_charge_last_name_kana} #{person_in_charge_first_name_kana}"
  end
end
