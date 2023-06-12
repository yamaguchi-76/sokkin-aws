# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_affiliate_scopes
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  affiliate_scope_id :bigint           not null
#  skill_id           :bigint           not null
#
# Indexes
#
#  index_skill_affiliate_scopes_on_affiliate_scope_id  (affiliate_scope_id)
#  index_skill_affiliate_scopes_on_skill_id            (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (affiliate_scope_id => affiliate_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_affiliate_scope do
    affiliate_scope { AffiliateScope.all.sample }
  end
end
