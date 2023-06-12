# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id                     :bigint           not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  proposition_id(案件ID) :bigint           not null
#  user_id(ユーザーID)    :bigint           not null
#
# Indexes
#
#  index_attendances_on_proposition_id  (proposition_id)
#  index_attendances_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposition_id => propositions.id)
#  fk_rails_...  (user_id => users.id)
#
class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :proposition

  has_many :operating_times, dependent: :destroy
  accepts_nested_attributes_for :operating_times, allow_destroy: true
  has_many :monthly_unit_prices, dependent: :destroy
  accepts_nested_attributes_for :monthly_unit_prices, allow_destroy: true
  has_many :feed_backs, dependent: :destroy
  accepts_nested_attributes_for :feed_backs, allow_destroy: true
  has_many :client_feed_backs, dependent: :destroy
  accepts_nested_attributes_for :client_feed_backs, allow_destroy: true
  has_many :payment_statuses, dependent: :destroy
  accepts_nested_attributes_for :payment_statuses, allow_destroy: true
end
