# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_image_ad_scopes
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  image_ad_scope_id :bigint           not null
#  skill_id          :bigint           not null
#
# Indexes
#
#  index_skill_image_ad_scopes_on_image_ad_scope_id  (image_ad_scope_id)
#  index_skill_image_ad_scopes_on_skill_id           (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_ad_scope_id => image_ad_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_image_ad_scope do
    image_ad_scope { ImageAdScope.all.sample }
  end
end
