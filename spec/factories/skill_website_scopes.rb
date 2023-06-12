# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_website_scopes
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  skill_id         :bigint           not null
#  website_scope_id :bigint           not null
#
# Indexes
#
#  index_skill_website_scopes_on_skill_id          (skill_id)
#  index_skill_website_scopes_on_website_scope_id  (website_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (website_scope_id => website_scopes.id)
#
FactoryBot.define do
  factory :skill_website_scope do
    website_scope { WebsiteScope.all.sample }
  end
end
