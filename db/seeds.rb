# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.production?
  #begin------------マスタ投入
  puts '===================='
  puts 'JobKindを作成'
  %w[プランナー メディアコンサルタント 運用オペレーター デザイナー ディレクター エンジニア その他].each_with_index do |name, i|
    JobKind.create!(name: name, display_sort: i)
  end

  puts '===================='
  puts 'WorkRangeを作成'
  %w[戦略立案・市場調査 メディアプランニング 運用ディレクション 広告運用
     提案レビュー コミュニケーション設計 静止画クリエイティブ企画・制作 動画クリエイティブ企画・制作
     LP企画・制作 メディア企画 データ設計・整形].each_with_index do |name, i|
    WorkRange.create!(name: name, display_sort: i)
  end

  puts '===================='
  puts 'WorkConditionを作成'
  %w[リモート 出社 対面打ち合わせ オンライン打ち合わせ 土日対応].each_with_index do |name, i|
    WorkCondition.create!(name: name, display_sort: i)
  end

  puts '===================='
  puts 'IndustryGroup、Industryを作成'
  manufacturer = ["メーカー",
                  ["食品・農林・水産",
                   "建設・住宅・インテリア",
                   "繊維・化学・薬品・化粧品",
                   "鉄鋼・金属・鉱業",
                   "機械・プラント",
                   "電子・電気機器",
                   "自動車・輸送用機器",
                   "精密・医療機器",
                   "印刷・事務機器関連",
                   "スポーツ・玩具",
                   "その他メーカー"]]
  trading_company = ["商社",
                     ["総合商社",
                      "専門商社"]]
  retail = ["小売",
            ["百貨店・スーパー",
             "コンビニ",
             "専門店"]]
  finance = ["金融",
             ["銀行・証券",
              "クレジット",
              "信販・リース",
              "その他金融",
              "生保・損保"]]
  service_infrastructure = ["サービス・インフラ",
                            ["不動産",
                             "鉄道・航空・運輸・物流",
                             "電力・ガス・エネルギー",
                             "フードサービス",
                             "ホテル・旅行",
                             "医療・福祉",
                             "アミューズメント・レジャー",
                             "その他サービス",
                             "コンサルティング・調査",
                             "人材サービス",
                             "教育"]]
  software = ["ソフトウエア",
              ["ソフトウエア",
               "インターネット",
               "通信"]]
  media = ["広告・出版・マスコミ",
           ["放送",
            "新聞",
            "出版",
            "広告"]]
  government_offices = ["官公庁・公社・団体",
                        ["官公庁・公社・団体"]]

  [manufacturer,
   trading_company,
   retail,
   finance,
   service_infrastructure,
   software,
   media,
   government_offices].each_with_index do |nested_array, group_index|
    industry_group = IndustryGroup.create!(name: nested_array.first, display_sort: group_index)
    nested_array.last.each_with_index do |industry_name, industry_index|
      Industry.create!(industry_group: industry_group, name: industry_name, display_sort: industry_index)
    end
  end

  # スキル診断用データ作成

  puts "===================="
  search_scope_answers = %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可]
  puts "SearchScopeに #{search_scope_answers} を登録"

  search_scope_answers.each do |answer|
    SearchScope.create(answer: answer)
  end

  puts "===================="
  display_scope_answers = %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可]
  puts "DisplayScopeに #{display_scope_answers} を登録"

  display_scope_answers.each do |answer|
    DisplayScope.create(answer: answer)
  end

  puts "===================="
  sns_scope_answers = %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可]
  puts "SnsScopeに #{sns_scope_answers} を登録"

  sns_scope_answers.each do |answer|
    SnsScope.create(answer: answer)
  end

  puts "===================="
  application_ad_scope_answers = %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可]
  puts "ApplicationAdScopeに #{application_ad_scope_answers} を登録"

  application_ad_scope_answers.each do |answer|
    ApplicationAdScope.create(answer: answer)
  end

  puts "===================="
  seo_scope_answers = %w[戦略立案(分析・対策KW選定など) 記事コンテンツ制作ディレクション 媒体トレンドキャッチアップ 提案・レビュー 対応不可]
  puts "SeoScopeに #{seo_scope_answers} を登録"

  seo_scope_answers.each do |answer|
    SeoScope.create(answer: answer)
  end

  puts "===================="
  crm_scope_answers = %w[施策設計・プランニング 運用 分析・提案レビュー 対応不可]
  puts "CrmScopeに #{crm_scope_answers} を登録"

  crm_scope_answers.each do |answer|
    CrmScope.create(answer: answer)
  end

  puts "===================="
  sns_owned_media_scope_answers = %w[戦略立案 運用 運用ディレクション コンテンツ制作 提案・レビュー 対応不可]
  puts "SnsOwnedMediaScopeに #{sns_owned_media_scope_answers} を登録"

  sns_owned_media_scope_answers.each do |answer|
    SnsOwnedMediaScope.create(answer: answer)
  end

  puts "===================="
  dsp_scope_answers = %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可]
  puts "DspScopeに #{dsp_scope_answers} を登録"

  dsp_scope_answers.each do |answer|
    DspScope.create(answer: answer)
  end

  puts "===================="
  video_scope_answers = %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可]
  puts "VideoScopeに #{video_scope_answers} を登録"

  video_scope_answers.each do |answer|
    VideoScope.create(answer: answer)
  end

  puts "===================="
  affiliate_scope_answers = %w[プランニング 運用ディレクション 提案・レビュー 対応不可]
  puts "AffiliateScopeに #{affiliate_scope_answers} を登録"

  affiliate_scope_answers.each do |answer|
    AffiliateScope.create(answer: answer)
  end

  puts "===================="
  sight_access_scope_answers = %w[調査・設計 分析 提案・レビュー 対応不可]
  puts "SightAccessScopeに #{sight_access_scope_answers} を登録"

  sight_access_scope_answers.each do |answer|
    SightAccessScope.create(answer: answer)
  end

  puts "===================="
  ma_scope_answers = %w[計測条件のプランニング 運用ディレクション 運用対応 提案・レビュー 対応不可]
  puts "MaScopeに #{ma_scope_answers} を登録"

  ma_scope_answers.each do |answer|
    MaScope.create(answer: answer)
  end

  puts "===================="
  tag_manager_scope_answers = %w[タグ環境設計 タグ設置ディレクション タグ設置対応 対応不可]
  puts "TagManagerScopeに #{tag_manager_scope_answers} を登録"

  tag_manager_scope_answers.each do |answer|
    TagManagerScope.create(answer: answer)
  end

  puts "===================="
  feed_scope_answers = %w[フィード設計 フィード作成ディレクション フィード作成 フィード管理 対応不可]
  puts "FeedScopeに #{feed_scope_answers} を登録"

  feed_scope_answers.each do |answer|
    FeedScope.create(answer: answer)
  end

  puts "===================="
  third_party_scope_answers = %w[計測条件のプランニング 運用ディレクション 運用対応 分析・レビュー 対応不可]
  puts "ThirdPartyScopeに #{third_party_scope_answers} を登録"

  third_party_scope_answers.each do |answer|
    ThirdPartyScope.create(answer: answer)
  end

  puts "===================="
  customer_scope_answers = %w[調査・設計 分析 提案 対応不可]
  puts "CustomerScopeに #{customer_scope_answers} を登録"

  customer_scope_answers.each do |answer|
    CustomerScope.create(answer: answer)
  end

  puts "===================="
  business_scope_answers = %w[調査・設計 分析 提案 対応不可]
  puts "BusinessScopeに #{business_scope_answers} を登録"

  business_scope_answers.each do |answer|
    BusinessScope.create(answer: answer)
  end

  puts "===================="
  three_c_scope_answers = %w[調査・設計 分析 提案 対応不可]
  puts "ThreeCScopeに #{three_c_scope_answers} を登録"

  three_c_scope_answers.each do |answer|
    ThreeCScope.create(answer: answer)
  end

  puts "===================="
  four_p_scope_answers = %w[調査・設計 分析 提案 対応不可]
  puts "FourPScopeに #{four_p_scope_answers} を登録"

  four_p_scope_answers.each do |answer|
    FourPScope.create(answer: answer)
  end

  puts "===================="
  persona_scope_answers = %w[調査・設計 分析 提案 対応不可]
  puts "PersonaScopeに #{persona_scope_answers} を登録"

  persona_scope_answers.each do |answer|
    PersonaScope.create(answer: answer)
  end

  puts "===================="
  user_survey_scope_answers = %w[調査・設計 分析 提案 対応不可]
  puts "UserSurveyScopeに #{user_survey_scope_answers} を登録"

  user_survey_scope_answers.each do |answer|
    UserSurveyScope.create(answer: answer)
  end

  puts "===================="
  pr_scope_answers = %w[戦略設計 施策設計・プランニング 分析・提案レビュー 対応不可]
  puts "PrScopeに #{pr_scope_answers} を登録"

  pr_scope_answers.each do |answer|
    PrScope.create(answer: answer)
  end

  puts "===================="
  customer_journey_scope_answers = %w[調査・設計 分析 提案 対応不可]
  puts "CustomerJourneyScopeに #{customer_journey_scope_answers} を登録"

  customer_journey_scope_answers.each do |answer|
    CustomerJourneyScope.create(answer: answer)
  end

  puts "===================="
  language_scope_answers = %w[英語 中国語 フランス語 対応不可]
  puts "LanguageScopeに #{language_scope_answers} を登録"

  language_scope_answers.each do |answer|
    LanguageScope.create(answer: answer)
  end

  puts "===================="
  kpi_scope_answers = %w[対応可能 対応不可]
  puts "KpiScopeに #{kpi_scope_answers} を登録"

  kpi_scope_answers.each do |answer|
    KpiScope.create(answer: answer)
  end

  puts "===================="
  influencer_scope_answers = %w[戦略設計 施策設計・プランニング 分析・提案レビュー 対応不可]
  puts "InfluencerScopeに #{influencer_scope_answers} を登録"

  influencer_scope_answers.each do |answer|
    InfluencerScope.create(answer: answer)
  end

  puts "===================="
  writing_scope_answers = %w[ワイヤー作成 構成作成 画像手配 記事執筆 リサーチ コーディング 対応不可]
  puts "WritingScopeに #{writing_scope_answers} を登録"

  writing_scope_answers.each do |answer|
    WritingScope.create(answer: answer)
  end

  puts "===================="
  website_scope_answers = %w[サイト構成作成 デザイン制作 素材手配 システム開発 コーディング 挙動テスト 対応不可]
  puts "WebsiteScopeに #{website_scope_answers} を登録"

  website_scope_answers.each do |answer|
    WebsiteScope.create(answer: answer)
  end

  puts "===================="
  ecsite_scope_answers = %w[サイト構成作成 デザイン制作 素材手配 システム開発 コーディング 挙動テスト 更新対応 対応不可]
  puts "EcsiteScopeに #{ecsite_scope_answers} を登録"

  ecsite_scope_answers.each do |answer|
    EcsiteScope.create(answer: answer)
  end

  puts "===================="
  application_production_scope_answers = %w[要件定義 基本設計 詳細設計 開発・実装・テスト ストア申請 保守・運用 対応不可]
  puts "ApplicationProductionScopeに #{application_production_scope_answers} を登録"

  application_production_scope_answers.each do |answer|
    ApplicationProductionScope.create(answer: answer)
  end

  puts "===================="
  image_ad_scope_answers = %w[コミュニケーションプランニング 素材手配 デザイン制作 Ad制作 実績分析 対応不可]
  puts "ImageAdScopeに #{image_ad_scope_answers} を登録"

  image_ad_scope_answers.each do |answer|
    ImageAdScope.create(answer: answer)
  end

  puts "===================="
  movie_ad_scope_answers = %w[コミュニケーションプランニング 素材手配 デザイン制作 Ad制作 実績分析 対応不可]
  puts "MovieAdScopeに #{movie_ad_scope_answers} を登録"

  movie_ad_scope_answers.each do |answer|
    MovieAdScope.create(answer: answer)
  end

  puts "===================="
  new_business_scope_answers = %w[企画施策 予算・工数策定 プロジェクト推進・管理 評価・レビュー 対応不可]
  puts "NewBusinessScopeに #{new_business_scope_answers} を登録"

  new_business_scope_answers.each do |answer|
    NewBusinessScope.create(answer: answer)
  end

  # NOTE: リリース時に投入したadminのseedデータ
  # puts '===================='
  # puts 'Adminを3件作成'
  # (1..3).each do |i|
  #   admin = FactoryBot.create(:admin, email: "info+#{i}@sokkin-match.me", password: SecureRandom.alphanumeric(12))
  #   puts <<-EOS
  #   -----
  #   admin #{i}件目
  #   email: #{admin.email}
  #   password: #{admin.password}
  #   EOS
  # end

  #end------------マスタ投入

  #begin------------サンプルデータ投入

  industry = Industry.first
  (1..5).each do |i|
    FactoryBot.create(:admin, email: "admin#{i}@example.com", password: "password")
    # FactoryBot.create(:user, email: "user#{i}@example.com", password: "password")
    company = FactoryBot.create(:company, email: "company#{i}@example.com", password: "password")
    (1..3).each do
      FactoryBot.create(:proposition,
                        :with_job_kinds,
                        :with_work_ranges,
                        :with_work_conditions,
                        job_kind_count: 3,
                        work_range_count: 3,
                        work_condition_count: 3,
                        company: company,
                        industry: industry)
    end
  end
end
