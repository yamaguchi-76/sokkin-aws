# frozen_string_literal: true

# == Schema Information
#
# Table name: bank_accounts
#
#  id                       :bigint           not null, primary key
#  account_holder(口座名義) :string(255)
#  account_kind(口座種別)   :integer
#  account_number(口座番号) :string(255)
#  bank_name(金融機関)      :string(255)
#  branch_name(支店名)      :string(255)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  user_id(ユーザーID)      :bigint           not null
#
# Indexes
#
#  index_bank_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class BankAccount < ApplicationRecord
  belongs_to :user

  # 0: 普通, 1: 当座
  enum account_kind: { saving_account: 0, current_account: 1 }

  with_options presence: true, on: :update do
    validates :bank_name
    validates :branch_name
    validates :account_kind
    validates :account_number
    validates :account_holder
  end
end
