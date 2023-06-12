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
class Skill < ApplicationRecord
  belongs_to :user

  has_many :skill_search_scopes, dependent: :destroy
  has_many :search_scopes, through: :skill_search_scopes
  accepts_nested_attributes_for :skill_search_scopes, allow_destroy: true

  has_many :skill_display_scopes, dependent: :destroy
  has_many :display_scopes, through: :skill_display_scopes

  has_many :skill_sns_scopes, dependent: :destroy
  has_many :sns_scopes, through: :skill_sns_scopes

  has_many :skill_application_ad_scopes, dependent: :destroy
  has_many :application_ad_scopes, through: :skill_application_ad_scopes

  has_many :skill_seo_scopes, dependent: :destroy
  has_many :seo_scopes, through: :skill_seo_scopes

  has_many :skill_crm_scopes, dependent: :destroy
  has_many :crm_scopes, through: :skill_crm_scopes

  has_many :skill_sns_owned_media_scopes, dependent: :destroy
  has_many :sns_owned_media_scopes, through: :skill_sns_owned_media_scopes

  has_many :skill_dsp_scopes, dependent: :destroy
  has_many :dsp_scopes, through: :skill_dsp_scopes

  has_many :skill_video_scopes, dependent: :destroy
  has_many :video_scopes, through: :skill_video_scopes

  has_many :skill_affiliate_scopes, dependent: :destroy
  has_many :affiliate_scopes, through: :skill_affiliate_scopes

  has_many :skill_sight_access_scopes, dependent: :destroy
  has_many :sight_access_scopes, through: :skill_sight_access_scopes

  has_many :skill_ma_scopes, dependent: :destroy
  has_many :ma_scopes, through: :skill_ma_scopes

  has_many :skill_tag_manager_scopes, dependent: :destroy
  has_many :tag_manager_scopes, through: :skill_tag_manager_scopes

  has_many :skill_feed_scopes, dependent: :destroy
  has_many :feed_scopes, through: :skill_feed_scopes

  has_many :skill_third_party_scopes, dependent: :destroy
  has_many :third_party_scopes, through: :skill_third_party_scopes

  has_many :skill_customer_scopes, dependent: :destroy
  has_many :customer_scopes, through: :skill_customer_scopes

  has_many :skill_business_scopes, dependent: :destroy
  has_many :business_scopes, through: :skill_business_scopes

  has_many :skill_three_c_scopes, dependent: :destroy
  has_many :three_c_scopes, through: :skill_three_c_scopes

  has_many :skill_four_p_scopes, dependent: :destroy
  has_many :four_p_scopes, through: :skill_four_p_scopes

  has_many :skill_persona_scopes, dependent: :destroy
  has_many :persona_scopes, through: :skill_persona_scopes

  has_many :skill_user_survey_scopes, dependent: :destroy
  has_many :user_survey_scopes, through: :skill_user_survey_scopes

  has_many :skill_pr_scopes, dependent: :destroy
  has_many :pr_scopes, through: :skill_pr_scopes

  has_many :skill_customer_journey_scopes, dependent: :destroy
  has_many :customer_journey_scopes, through: :skill_customer_journey_scopes

  has_many :skill_language_scopes, dependent: :destroy
  has_many :language_scopes, through: :skill_language_scopes

  has_many :skill_kpi_scopes, dependent: :destroy
  has_many :kpi_scopes, through: :skill_kpi_scopes

  has_many :skill_influencer_scopes, dependent: :destroy
  has_many :influencer_scopes, through: :skill_influencer_scopes

  has_many :skill_writing_scopes, dependent: :destroy
  has_many :writing_scopes, through: :skill_writing_scopes

  has_many :skill_website_scopes, dependent: :destroy
  has_many :website_scopes, through: :skill_website_scopes

  has_many :skill_ecsite_scopes, dependent: :destroy
  has_many :ecsite_scopes, through: :skill_ecsite_scopes

  has_many :skill_application_production_scopes, dependent: :destroy
  has_many :application_production_scopes, through: :skill_application_production_scopes

  has_many :skill_image_ad_scopes, dependent: :destroy
  has_many :image_ad_scopes, through: :skill_image_ad_scopes

  has_many :skill_movie_ad_scopes, dependent: :destroy
  has_many :movie_ad_scopes, through: :skill_movie_ad_scopes

  has_many :skill_new_business_scopes, dependent: :destroy
  has_many :new_business_scopes, through: :skill_new_business_scopes

  # enum
  enum customer_experience:               { customer_experience_rank_e: 0, customer_experience_rank_d: 1, customer_experience_rank_c: 2, customer_experience_rank_b: 3, customer_experience_rank_a: 4 }
  enum business_experience:               { business_experience_rank_e: 0, business_experience_rank_d: 1, business_experience_rank_c: 2, business_experience_rank_b: 3, business_experience_rank_a: 4 }
  enum kpi_experience:                    { kpi_experience_rank_e: 0, kpi_experience_rank_d: 1, kpi_experience_rank_c: 2, kpi_experience_rank_b: 3, kpi_experience_rank_a: 4 }
  enum crm_experience:                    { crm_experience_rank_e: 0, crm_experience_rank_d: 1, crm_experience_rank_c: 2, crm_experience_rank_b: 3, crm_experience_rank_a: 4 }
  enum influencer_experience:             { influencer_experience_rank_e: 0, influencer_experience_rank_d: 1, influencer_experience_rank_c: 2, influencer_experience_rank_b: 3, influencer_experience_rank_a: 4 }
  enum new_business_experience:           { new_business_experience_rank_e: 0, new_business_experience_rank_d: 1, new_business_experience_rank_c: 2, new_business_experience_rank_b: 3, new_business_experience_rank_a: 4 }
  enum search_experience:                 { search_experience_rank_e: 0, search_experience_rank_d: 1, search_experience_rank_c: 2, search_experience_rank_b: 3, search_experience_rank_a: 4 }
  enum display_experience:                { display_experience_rank_e: 0, display_experience_rank_d: 1, display_experience_rank_c: 2, display_experience_rank_b: 3, display_experience_rank_a: 4 }
  enum sns_experience:                    { sns_experience_rank_e: 0, sns_experience_rank_d: 1, sns_experience_rank_c: 2, sns_experience_rank_b: 3, sns_experience_rank_a: 4 }
  enum application_ad_experience:         { application_ad_experience_rank_e: 0, application_ad_experience_rank_d: 1, application_ad_experience_rank_c: 2, application_ad_experience_rank_b: 3, application_ad_experience_rank_a: 4 }
  enum seo_experience:                    { seo_experience_rank_e: 0, seo_experience_rank_d: 1, seo_experience_rank_c: 2, seo_experience_rank_b: 3, seo_experience_rank_a: 4 }
  enum sns_owned_media_experience:        { sns_owned_media_experience_rank_e: 0, sns_owned_media_experience_rank_d: 1, sns_owned_media_experience_rank_c: 2, sns_owned_media_experience_rank_b: 3, sns_owned_media_experience_rank_a: 4 }
  enum dsp_experience:                    { dsp_experience_rank_e: 0, dsp_experience_rank_d: 1, dsp_experience_rank_c: 2, dsp_experience_rank_b: 3, dsp_experience_rank_a: 4 }
  enum video_experience:                  { video_experience_rank_e: 0, video_experience_rank_d: 1, video_experience_rank_c: 2, video_experience_rank_b: 3, video_experience_rank_a: 4 }
  enum affiliate_experience:              { affiliate_experience_rank_e: 0, affiliate_experience_rank_d: 1, affiliate_experience_rank_c: 2, affiliate_experience_rank_b: 3, affiliate_experience_rank_a: 4 }
  enum ma_experience:                     { ma_experience_rank_e: 0, ma_experience_rank_d: 1, ma_experience_rank_c: 2, ma_experience_rank_b: 3, ma_experience_rank_a: 4 }
  enum website_experience:                { website_experience_rank_e: 0, website_experience_rank_d: 1, website_experience_rank_c: 2, website_experience_rank_b: 3, website_experience_rank_a: 4 }
  enum ecsite_experience:                 { ecsite_experience_rank_e: 0, ecsite_experience_rank_d: 1, ecsite_experience_rank_c: 2, ecsite_experience_rank_b: 3, ecsite_experience_rank_a: 4 }
  enum image_ad_experience:               { image_ad_experience_rank_e: 0, image_ad_experience_rank_d: 1, image_ad_experience_rank_c: 2, image_ad_experience_rank_b: 3, image_ad_experience_rank_a: 4 }
  enum movie_ad_experience:               { movie_ad_experience_rank_e: 0, movie_ad_experience_rank_d: 1, movie_ad_experience_rank_c: 2, movie_ad_experience_rank_b: 3, movie_ad_experience_rank_a: 4 }
  enum application_production_experience: { application_production_experience_rank_e: 0, application_production_experience_rank_d: 1, application_production_experience_rank_c: 2, application_production_experience_rank_b: 3, application_production_experience_rank_a: 4 }
  enum sight_access_experience:           { sight_access_experience_rank_e: 0, sight_access_experience_rank_d: 1, sight_access_experience_rank_c: 2, sight_access_experience_rank_b: 3, sight_access_experience_rank_a: 4 }
  enum tag_manager_experience:            { tag_manager_experience_rank_e: 0, tag_manager_experience_rank_d: 1, tag_manager_experience_rank_c: 2, tag_manager_experience_rank_b: 3, tag_manager_experience_rank_a: 4 }
  enum feed_experience:                   { feed_experience_rank_e: 0, feed_experience_rank_d: 1, feed_experience_rank_c: 2, feed_experience_rank_b: 3, feed_experience_rank_a: 4 }
  enum third_party_experience:            { third_party_experience_rank_e: 0, third_party_experience_rank_d: 1, third_party_experience_rank_c: 2, third_party_experience_rank_b: 3, third_party_experience_rank_a: 4 }
  enum three_c_experience:                { three_c_experience_rank_e: 0, three_c_experience_rank_d: 1, three_c_experience_rank_c: 2, three_c_experience_rank_b: 3, three_c_experience_rank_a: 4 }
  enum four_p_experience:                 { four_p_experience_rank_e: 0, four_p_experience_rank_d: 1, four_p_experience_rank_c: 2, four_p_experience_rank_b: 3, four_p_experience_rank_a: 4 }
  enum persona_experience:                { persona_experience_rank_e: 0, persona_experience_rank_d: 1, persona_experience_rank_c: 2, persona_experience_rank_b: 3, persona_experience_rank_a: 4 }
  enum user_survey_experience:            { user_survey_experience_rank_e: 0, user_survey_experience_rank_d: 1, user_survey_experience_rank_c: 2, user_survey_experience_rank_b: 3, user_survey_experience_rank_a: 4 }
  enum customer_journey_experience:       { customer_journey_experience_rank_e: 0, customer_journey_experience_rank_d: 1, customer_journey_experience_rank_c: 2, customer_journey_experience_rank_b: 3, customer_journey_experience_rank_a: 4 }
  enum language_experience:               { language_experience_rank_e: 0, language_experience_rank_d: 1, language_experience_rank_c: 2, language_experience_rank_b: 3, language_experience_rank_a: 4 }
  enum writing_experience:                { writing_experience_rank_e: 0, writing_experience_rank_d: 1, writing_experience_rank_c: 2, writing_experience_rank_b: 3, writing_experience_rank_a: 4 }
  enum pr_experience:                     { pr_experience_rank_e: 0, pr_experience_rank_d: 1, pr_experience_rank_c: 2, pr_experience_rank_b: 3, pr_experience_rank_a: 4 }

  def registered?
    update_count != 0
  end
end
