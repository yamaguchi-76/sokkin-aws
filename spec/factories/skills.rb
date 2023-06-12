# frozen_string_literal: true

# == Schema Information
#
# Table name: skills
#
#  id                                                             :bigint           not null, primary key
#  affiliate_experience(アフィリエイト_実務経験)                  :integer
#  application_ad_experience(アプリ広告_実務経験)                 :integer
#  application_production_experience(アプリ制作_実務経験)         :integer
#  business_experience(ToB向け広告戦略の立案_実務経験)            :integer
#  crm_experience(CRM_実務経験)                                   :integer
#  customer_experience(ToC向け広告戦略の立案_実務経験)            :integer
#  customer_journey_experience(カスタマージャーニー作成_実務経験) :integer
#  designer(デザイナー)                                           :boolean          default(FALSE)
#  director(ディレクター)                                         :boolean          default(FALSE)
#  display_experience(Display広告_実務経験)                       :integer
#  dsp_experience(DSP・ADNW_実務経験)                             :integer
#  ecsite_experience(ECサイト制作_実務経験)                       :integer
#  engineer(エンジニア)                                           :boolean          default(FALSE)
#  feed_experience(フィード/フィードマネージャー_実務経験)        :integer
#  four_p_experience(4P分析_実務経験)                             :integer
#  image_ad_experience(静止画のAd制作_実務経験)                   :integer
#  influencer_experience(インフルエンサー施策_実務経験)           :integer
#  kpi_experience(KPI・KGIの設計_実務経験)                        :integer
#  language_experience(語学力_実務経験)                           :integer
#  ma_experience(MAツール_実務経験)                               :integer
#  media_consultant(メディアコンサルタント)                       :boolean          default(FALSE)
#  movie_ad_experience(動画のAd制作_実務経験)                     :integer
#  new_business_experience(新規事業立ち上げ_実務経験)             :integer
#  operation_operator(運用オペレーター)                           :boolean          default(FALSE)
#  persona_experience(ペルソナ分析_実務経験)                      :integer
#  planner(プランナー)                                            :boolean          default(FALSE)
#  pr_experience(PR_実務経験)                                     :integer
#  search_experience(検索広告_実務経験)                           :integer
#  seo_experience(SEO・ASO_実務経験)                              :integer
#  sight_access_experience(サイト・アクセス解析_実務経験)         :integer
#  sns_experience(SNS広告_実務経験)                               :integer
#  sns_owned_media_experience(SNSオウンドメディア運用_実務経験)   :integer
#  tag_manager_experience(タグマネージャー_実務経験)              :integer
#  third_party_experience(3rdParty広告計測ツール_実務経験)        :integer
#  three_c_experience(3C分析_実務経験)                            :integer
#  update_count                                                   :integer          default(0), not null
#  user_survey_experience(ユーザー調査_実務経験)                  :integer
#  video_experience(動画広告_実務経験)                            :integer
#  website_experience(WEBサイト制作_実務経験)                     :integer
#  writing_experience(記事制作_実務経験)                          :integer
#  created_at                                                     :datetime         not null
#  updated_at                                                     :datetime         not null
#  user_id                                                        :bigint           not null
#
# Indexes
#
#  index_skills_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :skill do
    user
    update_count { 0 }
  end
end
