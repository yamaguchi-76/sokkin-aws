# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_ma_scopes
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ma_scope_id :bigint           not null
#  skill_id    :bigint           not null
#
# Indexes
#
#  index_skill_ma_scopes_on_ma_scope_id  (ma_scope_id)
#  index_skill_ma_scopes_on_skill_id     (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (ma_scope_id => ma_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_ma_scope do
    ma_scope { MaScope.all.sample }
  end
end
