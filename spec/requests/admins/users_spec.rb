# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/admins/users", type: :request do
  describe "GET /admins/users/export_csv" do
    subject { get export_csv_admins_users_path(format: :csv) }

    let!(:current_admin) { create(:admin) }

    include_context "adminユーザーでログイン"

    let!(:user1) do
      create(:user,
             first_name: "test1",
             first_name_kana: "てすといち",
             last_name: "csv",
             last_name_kana: "しーえすぶい",
             phone_number: "9999-99-9999",
             postal_code: "1231234",
             address: "東京都千代田区丸の内1丁目",
             gender: 0,
             birthday: "1900-12-31",
             second_job_experience: true)
    end
    let!(:user2) do
      create(:user,
             first_name: "test2",
             first_name_kana: "てすとに",
             last_name: "csv",
             last_name_kana: "しーえすぶい",
             phone_number: "9999-99-9998",
             postal_code: "1231235",
             address: "東京都千代田区丸の内2丁目",
             gender: 1,
             birthday: "1800-12-31",
             second_job_experience: false)
    end
    let!(:user3) { create(:user, :all_nil) }

    let(:expect_headers_from_user_table) do
      %w[ID 氏名 ふりがな 電話番号 郵便番号 住所 性別 生年月日]
    end
    let(:expect_headers_from_educational_background_table) do
      %w[最終学歴 学校名 学部名 卒業年度]
    end
    let(:expect_headers_from_employment_status_table) do
      %w[現在の就業形態 現在の会社名 現在の業種 現在の職種 役職 年収 現在の月間稼働時間 経験業務内容 就業開始年月 就業終了年月]
    end
    let(:expect_headers_from_self_introduction_table) do
      %w[自己PR 希望単価/時間 希望稼働時間/日 希望勤務日数/月 対面ミーティング 対応ステータス 対応条件 インボイス登録 インボイス登録番号 ポートフォリオ]
    end
    let(:expect_headers_from_skill_table) do
      %w[
          スキル
          検索広告(実務経験年数)
          検索広告(対応可能な業務範囲)
          Display広告(実務経験年数)
          Display広告(対応可能な業務範囲)
          SNS広告(実務経験年数)
          SNS広告(対応可能な業務範囲)
          アプリ広告(実務経験年数)
          アプリ広告(対応可能な業務範囲)
          SEO・ASO(実務経験年数)
          SEO・ASO(対応可能な業務範囲)
          CRM(実務経験年数)
          CRM(対応可能な業務範囲)
          SNSオウンドメディア運用(実務経験年数)
          SNSオウンドメディア運用(対応可能な業務範囲)
          DSP・ADNW(実務経験年数)
          DSP・ADNW(対応可能な業務範囲)
          動画広告(実務経験年数)
          動画広告(対応可能な業務範囲)
          アフィリエイト(実務経験年数)
          アフィリエイト(対応可能な業務範囲)
          サイト・アクセス解析(実務経験年数)
          サイト・アクセス解析(対応可能な業務範囲)
          MAツール(実務経験年数)
          MAツール(対応可能な業務範囲)
          Googleタグマネージャー(実務経験年数)
          Googleタグマネージャー(対応可能な業務範囲)
          フィード/フィードマネージャー(実務経験年数)
          フィード/フィードマネージャー(対応可能な業務範囲)
          3rdParty広告計測ツール(実務経験年数)
          3rdParty広告計測ツール(対応可能な業務範囲)
          ToC向け広告戦略の立案(実務経験年数)
          ToC向け広告戦略の立案(対応可能な業務範囲)
          ToB向け広告戦略の立案(実務経験年数)
          ToB向け広告戦略の立案(対応可能な業務範囲)
          3C分析(実務経験年数)
          3C分析(対応可能な業務範囲)
          4P分析(実務経験年数)
          4P分析(対応可能な業務範囲)
          ペルソナ分析(実務経験年数)
          ペルソナ分析(対応可能な業務範囲)
          ユーザー調査(実務経験年数)
          ユーザー調査(対応可能な業務範囲)
          PR(実務経験年数)
          PR(対応可能な業務範囲)
          カスタマージャーニー作成(実務経験年数)
          カスタマージャーニー作成(対応可能な業務範囲)
          語学力(実務経験年数)
          語学力(対応可能な業務範囲)
          KPI・KGIの設計(実務経験年数)
          KPI・KGIの設計(対応可能な業務範囲)
          インフルエンサー施策(実務経験年数)
          インフルエンサー施策(対応可能な業務範囲)
          記事制作(実務経験年数)
          記事制作(対応可能な業務範囲)
          WEBサイト制作(実務経験年数)
          WEBサイト制作(対応可能な業務範囲)
          ECサイト制作(実務経験年数)
          ECサイト制作(対応可能な業務範囲)
          アプリ制作(実務経験年数)
          アプリ制作(対応可能な業務範囲)
          静止画のAd制作(実務経験年数)
          静止画のAd制作(対応可能な業務範囲)
          動画のAd制作(実務経験年数)
          動画のAd制作(対応可能な業務範囲)
          新規事業立ち上げ(実務経験年数)
          新規事業立ち上げ(対応可能な業務範囲)
        ]
    end

    describe "ユースケース" do
      before do
        # user1 educational_background
        create(:educational_background,
               user: user1,
               recent_academic_history: :masters_dropout,
               school_name: "example大学1",
               faculty_name: "example学部1",
               graduated_year: "2000-12-31")
        # user1  employment_status
        create(:employment_status,
               user: user1,
               status: :employee,
               company_name: "example会社名1",
               industry_category: "example業種1",
               job_kind: JobKind.find_by(name: "その他"),
               job_title: "部長",
               yearly_income: 500,
               working_hours: 5,
               working_days_of_the_week: 8,
               business_experience: "exampleな経験業務内容。\ntestな業務内容",
               employment_start_date: Date.new(2022, 4, 1),
               employment_end_date: Date.new(2023, 3, 31))
        # user1  past_employment_statuses[0]
        create(:past_employment_status,
               user: user1,
               company_name: "example過去の会社名1",
               previous_client_or_industry: "example過去の担当顧客や業種1",
               employment_start_date: Date.new(2020, 4, 1),
               employment_end_date: Date.new(2022, 3, 31))
        # user1  past_employment_statuses[1]
        create(:past_employment_status,
               user: user1,
               company_name: "example過去の会社名2",
               previous_client_or_industry: "example過去の担当顧客や業種2",
               employment_start_date: Date.new(2010, 4, 1),
               employment_end_date: Date.new(2020, 3, 31))
        # user1 double_job_experiences[0]
        create(:double_job_experience,
               user: user1,
               company_name: "example複業会社名1",
               job_kind: JobKind.find_by(name: "プランナー"),
               monthly_income: 10,
               working_hours: 1,
               employment_start_date: Date.new(2030, 4, 1),
               employment_end_date: Date.new(2040, 3, 31),
               business_experience: "複業1\nの具体的な業務内容")
        # user1 double_job_experiences[1]
        create(:double_job_experience,
               user: user1,
               company_name: "example複業会社名2",
               job_kind: JobKind.find_by(name: "メディアコンサルタント"),
               monthly_income: 20,
               working_hours: 2,
               employment_start_date: Date.new(2018, 4, 1),
               employment_end_date: Date.new(2019, 3, 31),
               business_experience: "複業2\nの具体的な業務内容")
        # user1 self_introduction
        create(:self_introduction,
               user: user1,
               self_pr: "exampleな自己紹介\n以下自己紹介",
               desired_unit_price: 3,
               desired_working_hours: 4,
               desired_working_days: 5,
               in_person_meeting: :possible,
               handle_status: :now,
               handle_conditions: :double_job,
               registered_invoice: true,
               invoice_number: 1234567890123,
               portfolio: "https://sokkin.me/")
        # user1  skill
        user1_skill = create(:skill,
                             user: user1,
                             designer: true,
                             director: true,
                             engineer: true,
                             media_consultant: true,
                             operation_operator: true,
                             planner: true,
                             search_experience: :search_experience_rank_e,
                             display_experience: :display_experience_rank_d,
                             sns_experience: :sns_experience_rank_c,
                             application_ad_experience: :application_ad_experience_rank_b,
                             seo_experience: :seo_experience_rank_a,
                             crm_experience: :crm_experience_rank_a,
                             sns_owned_media_experience: :sns_owned_media_experience_rank_a,
                             dsp_experience: :dsp_experience_rank_a,
                             video_experience: :video_experience_rank_a,
                             affiliate_experience: :affiliate_experience_rank_a,
                             sight_access_experience: :sight_access_experience_rank_a,
                             ma_experience: :ma_experience_rank_a,
                             tag_manager_experience: :tag_manager_experience_rank_a,
                             feed_experience: :feed_experience_rank_a,
                             third_party_experience: :third_party_experience_rank_a,
                             customer_experience: :customer_experience_rank_a,
                             business_experience: :business_experience_rank_a,
                             three_c_experience: :three_c_experience_rank_a,
                             four_p_experience: :four_p_experience_rank_a,
                             persona_experience: :persona_experience_rank_a,
                             user_survey_experience: :user_survey_experience_rank_a,
                             pr_experience: :pr_experience_rank_a,
                             customer_journey_experience: :customer_journey_experience_rank_a,
                             language_experience: :language_experience_rank_a,
                             kpi_experience: :kpi_experience_rank_a,
                             influencer_experience: :influencer_experience_rank_a,
                             writing_experience: :writing_experience_rank_a,
                             website_experience: :website_experience_rank_a,
                             ecsite_experience: :ecsite_experience_rank_a,
                             application_production_experience: :application_production_experience_rank_a,
                             image_ad_experience: :image_ad_experience_rank_a,
                             movie_ad_experience: :movie_ad_experience_rank_a,
                             new_business_experience: :new_business_experience_rank_a)
        # user1 各スキルスコープ（？）を作成
        AffiliateScope.all.each { |r| create(:skill_affiliate_scope, skill: user1_skill, affiliate_scope: r) }
        ApplicationAdScope.all.each { |r| create(:skill_application_ad_scope, skill: user1_skill, application_ad_scope: r) }
        ApplicationProductionScope .all.each { |r| create(:skill_application_production_scope, skill: user1_skill, application_production_scope: r) }
        BusinessScope.all.each { |r| create(:skill_business_scope, skill: user1_skill, business_scope: r) }
        CrmScope.all.each { |r| create(:skill_crm_scope, skill: user1_skill, crm_scope: r) }
        CustomerJourneyScope.all.each { |r| create(:skill_customer_journey_scope, skill: user1_skill, customer_journey_scope: r) }
        CustomerScope.all.each { |r| create(:skill_customer_scope, skill: user1_skill, customer_scope: r) }
        DisplayScope.all.each { |r| create(:skill_display_scope, skill: user1_skill, display_scope: r) }
        DspScope.all.each { |r| create(:skill_dsp_scope, skill: user1_skill, dsp_scope: r) }
        EcsiteScope.all.each { |r| create(:skill_ecsite_scope, skill: user1_skill, ecsite_scope: r) }
        FeedScope.all.each { |r| create(:skill_feed_scope, skill: user1_skill, feed_scope: r) }
        FourPScope.all.each { |r| create(:skill_four_p_scope, skill: user1_skill, four_p_scope: r) }
        ImageAdScope.all.each { |r| create(:skill_image_ad_scope, skill: user1_skill, image_ad_scope: r) }
        InfluencerScope.all.each { |r| create(:skill_influencer_scope, skill: user1_skill, influencer_scope: r) }
        KpiScope.all.each { |r| create(:skill_kpi_scope, skill: user1_skill, kpi_scope: r) }
        LanguageScope.all.each { |r| create(:skill_language_scope, skill: user1_skill, language_scope: r) }
        MaScope.all.each { |r| create(:skill_ma_scope, skill: user1_skill, ma_scope: r) }
        MovieAdScope.all.each { |r| create(:skill_movie_ad_scope, skill: user1_skill, movie_ad_scope: r) }
        NewBusinessScope.all.each { |r| create(:skill_new_business_scope, skill: user1_skill, new_business_scope: r) }
        PersonaScope.all.each { |r| create(:skill_persona_scope, skill: user1_skill, persona_scope: r) }
        PrScope.all.each { |r| create(:skill_pr_scope, skill: user1_skill, pr_scope: r) }
        SearchScope.all.each { |r| create(:skill_search_scope, skill: user1_skill, search_scope: r) }
        SeoScope.all.each { |r| create(:skill_seo_scope, skill: user1_skill, seo_scope: r) }
        SightAccessScope.all.each { |r| create(:skill_sight_access_scope, skill: user1_skill, sight_access_scope: r) }
        SnsOwnedMediaScope.all.each { |r| create(:skill_sns_owned_media_scope, skill: user1_skill, sns_owned_media_scope: r) }
        SnsScope.all.each { |r| create(:skill_sns_scope, skill: user1_skill, sns_scope: r) }
        TagManagerScope.all.each { |r| create(:skill_tag_manager_scope, skill: user1_skill, tag_manager_scope: r) }
        ThirdPartyScope.all.each { |r| create(:skill_third_party_scope, skill: user1_skill, third_party_scope: r) }
        ThreeCScope.all.each { |r| create(:skill_three_c_scope, skill: user1_skill, three_c_scope: r) }
        UserSurveyScope.all.each { |r| create(:skill_user_survey_scope, skill: user1_skill, user_survey_scope: r) }
        VideoScope.all.each { |r| create(:skill_video_scope, skill: user1_skill, video_scope: r) }
        WebsiteScope.all.each { |r| create(:skill_website_scope, skill: user1_skill, website_scope: r) }
        WritingScope.all.each { |r| create(:skill_writing_scope, skill: user1_skill, writing_scope: r) }

        # user2 educational_background
        create(:educational_background,
               user: user2,
               recent_academic_history: :masters_graduate,
               school_name: "example大学2",
               faculty_name: "example学部2",
               graduated_year: "1800-12-31")
        # user2  employment_status
        create(:employment_status,
                user: user2,
                status: :freelance,
                company_name: "example会社名2",
                industry_category: "example業種2",
                job_kind: JobKind.find_by(name: "エンジニア"),
                job_title: "課長",
                yearly_income: 200,
                working_hours: 2,
                working_days_of_the_week: 3,
                business_experience: "exampleな経験業務内容2。\ntestな業務内容2",
                employment_start_date: Date.new(1022, 4, 1),
                employment_end_date: Date.new(1023, 3, 1))
        # user2 self_introduction
        create(:self_introduction,
               user: user2,
               self_pr: "exampleな自己紹介2\n以下自己紹介2",
               desired_unit_price: 30,
               desired_working_hours: 40,
               desired_working_days: 50,
               in_person_meeting: :impossible,
               handle_status: :no_status,
               handle_conditions: :no_conditions,
               registered_invoice: false)
      end

      let(:expect_headers_from_past_employment_status_table) do
        %w[過去の会社名1 過去の担当顧客や業種1 過去の就業開始年月1 過去の就業終了年月1 過去の会社名2 過去の担当顧客や業種2 過去の就業開始年月2 過去の就業終了年月2]
      end
      let(:expect_headers_from_double_job_experience_table) do
        %w[複業会社名1 複業職種1 複業月収1 複業稼働時間1/日 複業開始年月1 複業終了年月1 複業業務内容1 複業会社名2 複業職種2 複業月収2 複業稼働時間2/日 複業開始年月2 複業終了年月2 複業業務内容2]
      end

      let(:expected_csv_header) do
        [
          expect_headers_from_user_table,
          expect_headers_from_educational_background_table,
          expect_headers_from_employment_status_table,
          expect_headers_from_past_employment_status_table,
          "複業経験有無",
          expect_headers_from_double_job_experience_table,
          expect_headers_from_self_introduction_table,
          expect_headers_from_skill_table,
        ].flatten
      end

      # NOTE: 全て登録されているユーザー(過去の会社2件、複業2件)
      let(:expected_csv_row_user1) do
        [
          user1.id.to_s,
          "csv test1", # user1.full_name,
          "しーえすぶい てすといち", # user1.full_name_kana,
          "9999-99-9999", # user1.phone_number,
          "1231234", # user1.postal_code,
          "東京都千代田区丸の内1丁目", # user1.address,
          "男性", # user1.gender_i18n,
          "1900-12-31", # user1.birthday,
          "大学院中退", # user1.education_background.recent_academic_history_i18n,
          "example大学1", # user1.education_background.school_name,
          "example学部1", # user1.education_background.faculty_name,
          "2000-12-31", # user1.education_background.graduated_year,
          "正社員", # user1. employment_status.status_i18n,
          "example会社名1", # user1. employment_status.company_name,
          "example業種1", # user1. employment_status.industry_category,
          "その他", # user1. employment_status.job_kind.name,
          "部長", # user1. employment_status.job_title,
          "500", # user1. employment_status.yearly_income,
          "週5日 1日8時間", # user1. employment_status.working_hours, user1. employment_status.working_days_of_the_week
          "exampleな経験業務内容。\ntestな業務内容", # user1. employment_status.business_experience,
          "2022-04-01", # user1. employment_status.employment_start_date,
          "2023-03-31", # user1. employment_status.employment_end_date,
          "example過去の会社名1", # user1.past_employment_statuses[0].company_name,
          "example過去の担当顧客や業種1", # user1.past_employment_statuses[0].previous_client_or_industry,
          "2020-04-01", # user1.past_employment_statuses[0].employment_start_date,
          "2022-03-31", # user1.past_employment_statuses[0].employment_end_date,
          "example過去の会社名2", # user1.past_employment_statuses[1].company_name,
          "example過去の担当顧客や業種2", # user1.past_employment_statuses[1].previous_client_or_industry,
          "2010-04-01", # user1.past_employment_statuses[1].employment_start_date,
          "2020-03-31", # user1.past_employment_statuses[1].employment_end_date,
          "あり", # user1.second_job_experience,
          "example複業会社名1", # user1.double_job_experiences[0].company_name,
          "プランナー", # user1.double_job_experiences[0].job_kind.name,
          "10", # user1.double_job_experiences[0].monthly_income,
          "1", # user1.double_job_experiences[0].working_hours,
          "2030-04-01", # user1.double_job_experiences[0].employment_start_date,
          "2040-03-31", # user1.double_job_experiences[0].employment_end_date,
          "複業1\nの具体的な業務内容", # user1.double_job_experiences[0].business_experience,
          "example複業会社名2", # user1.double_job_experiences[1].company_name,
          "メディアコンサルタント", # user1.double_job_experiences[1].job_kind.name,
          "20", # user1.double_job_experiences[1].monthly_income,
          "2", # user1.double_job_experiences[1].working_hours,
          "2018-04-01", # user1.double_job_experiences[1].employment_start_date,
          "2019-03-31", # user1.double_job_experiences[1].employment_end_date,
          "複業2\nの具体的な業務内容", # user1.double_job_experiences[1].business_experience,
          "exampleな自己紹介\n以下自己紹介", # user1.self_introduction.self_pr,
          "3", # user1.self_introduction.desired_unit_price,
          "4", # user1.self_introduction.desired_working_hours,
          "5", # user1.self_introduction.desired_working_days,
          "可", # user1.self_introduction.in_person_meeting_i18n,
          "今すぐ対応したい", # user1.self_introduction.handle_status_i18n,
          "複業のためコアタイムは対応が制限される", # user1.self_introduction.handle_conditions_i18n,
          "登録済み", # user1.self_introduction.registered_invoice,
          "T1234567890123", # user1.self_introduction.invoice_number,
          "https://sokkin.me/", # user1.self_introduction.portfolio,
          %w[プランナー メディアコンサルタント 運用オペレーター デザイナー ディレクター エンジニア].join(" "),
          "経験なし", # user1.skill.search_experience_i18n,
          %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可].join(" "),
          "3年未満", # user1.skill.display_experience_i18n,
          %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可].join(" "),
          "3年以上5年未満", # user1.skill.sns_experience_i18n,
          %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可].join(" "),
          "5年以上10年未満", # user1.skill.application_ad_experience_i18n,
          %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.seo_experience_i18n,
          %w[戦略立案(分析・対策KW選定など) 記事コンテンツ制作ディレクション 媒体トレンドキャッチアップ 提案・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.crm_experience_i18n,
          %w[施策設計・プランニング 運用 分析・提案レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.sns_owned_media_experience_i18n,
          %w[戦略立案 運用 運用ディレクション コンテンツ制作 提案・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.dsp_experience_i18n,
          %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.video_experience_i18n,
          %w[プランニング 運用ディレクション 広告運用（入稿・入札など） 提案・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.affiliate_experience_i18n,
          %w[プランニング 運用ディレクション 提案・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.sight_access_experience_i18n,
          %w[調査・設計 分析 提案・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.ma_experience_i18n,
          %w[計測条件のプランニング 運用ディレクション 運用対応 提案・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.tag_manager_experience_i18n,
          %w[タグ環境設計 タグ設置ディレクション タグ設置対応 対応不可].join(" "),
          "10年以上", # user1.skill.feed_experience_i18n,
          %w[フィード設計 フィード作成ディレクション フィード作成 フィード管理 対応不可].join(" "),
          "10年以上", # user1.skill.third_party_experience_i18n,
          %w[計測条件のプランニング 運用ディレクション 運用対応 分析・レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.customer_experience_i18n,
          %w[調査・設計 分析 提案 対応不可].join(" "),
          "10年以上", # user1.skill.business_experience_i18n,
          %w[調査・設計 分析 提案 対応不可].join(" "),
          "10年以上", # user1.skill.three_c_experience_i18n,
          %w[調査・設計 分析 提案 対応不可].join(" "),
          "10年以上", # user1.skill.four_p_experience_i18n,
          %w[調査・設計 分析 提案 対応不可].join(" "),
          "10年以上", # user1.skill.persona_experience_i18n,
          %w[調査・設計 分析 提案 対応不可].join(" "),
          "10年以上", # user1.skill.user_survey_experience_i18n,
          %w[調査・設計 分析 提案 対応不可].join(" "),
          "10年以上", # user1.skill.pr_experience_i18n,
          %w[戦略設計 施策設計・プランニング 分析・提案レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.customer_journey_experience_i18n,
          %w[調査・設計 分析 提案 対応不可].join(" "),
          "10年以上", # user1.skill.language_experience_i18n,
          %w[英語 中国語 フランス語 対応不可].join(" "),
          "10年以上", # user1.skill.kpi_experience_i18n,
          %w[対応可能 対応不可].join(" "),
          "10年以上", # user1.skill.influencer_experience_i18n,
          %w[戦略設計 施策設計・プランニング 分析・提案レビュー 対応不可].join(" "),
          "10年以上", # user1.skill.writing_experience_i18n,
          %w[ワイヤー作成 構成作成 画像手配 記事執筆 リサーチ コーディング 対応不可].join(" "),
          "10年以上", # user1.skill.website_experience_i18n,
          %w[サイト構成作成 デザイン制作 素材手配 システム開発 コーディング 挙動テスト 対応不可].join(" "),
          "10年以上", # user1.skill.ecsite_experience_i18n,
          %w[サイト構成作成 デザイン制作 素材手配 システム開発 コーディング 挙動テスト 更新対応 対応不可].join(" "),
          "10年以上", # user1.skill.application_production_experience_i18n,
          %w[要件定義 基本設計 詳細設計 開発・実装・テスト ストア申請 保守・運用 対応不可].join(" "),
          "10年以上", # user1.skill.image_ad_experience_i18n,
          %w[コミュニケーションプランニング 素材手配 デザイン制作 Ad制作 実績分析 対応不可].join(" "),
          "10年以上", # user1.skill.movie_ad_experience_i18n,
          %w[コミュニケーションプランニング 素材手配 デザイン制作 Ad制作 実績分析 対応不可].join(" "),
          "10年以上", # user1.skill.new_business_experience_i18n,
          %w[企画施策 予算・工数策定 プロジェクト推進・管理 評価・レビュー 対応不可].join(" "),
        ]
      end

      # NOTE: スキル以外登録されているユーザー(過去の会社なし、複業なし)
      let(:expected_csv_row_user2) do
        [
          user2.id.to_s,
          "csv test2", # user2.full_name,
          "しーえすぶい てすとに", # user2.full_name_kana,
          "9999-99-9998", # user2.phone_number,
          "1231235", # user2.postal_code,
          "東京都千代田区丸の内2丁目", # user2.address,
          "女性", # user2.gender_i18n,
          "1800-12-31", # user2.birthday,
          "大学院卒", # user2.education_background.recent_academic_history_i18n,
          "example大学2", # user2.education_background.school_name,
          "example学部2", # user2.education_background.faculty_name,
          "1800-12-31", # user2.education_background.graduated_year,
          "フリーランス", # user2. employment_status.status_i18n,
          "example会社名2", # user2. employment_status.company_name,
          "example業種2", # user2. employment_status.industry_category,
          "エンジニア", # user2. employment_status.job_kind.name,
          "課長", # user2. employment_status.job_title,
          "200", # user2. employment_status.yearly_income,
          "週2日 1日3時間", # user2. employment_status.working_hours, user2. employment_status.working_days_of_the_week
          "exampleな経験業務内容2。\ntestな業務内容2", # user2. employment_status.business_experience,
          "1022-04-01", # user2. employment_status.employment_start_date,
          "1023-03-01", # user2. employment_status.employment_end_date,
          nil, # user2.past_employment_statuses[0].company_name,
          nil, # user2.past_employment_statuses[0].previous_client_or_industry,
          nil, # user2.past_employment_statuses[0].employment_start_date,
          nil, # user2.past_employment_statuses[0].employment_end_date,
          nil, # user2.past_employment_statuses[1].company_name,
          nil, # user2.past_employment_statuses[1].previous_client_or_industry,
          nil, # user2.past_employment_statuses[1].employment_start_date,
          nil, # user2.past_employment_statuses[1].employment_end_date,
          "なし", # user2.second_job_experience,
          nil, # user2.double_job_experiences[0].company_name,
          nil, # user2.double_job_experiences[0].job_kind.name,
          nil, # user2.double_job_experiences[0].monthly_income,
          nil, # user2.double_job_experiences[0].working_hours,
          nil, # user2.double_job_experiences[0].employment_start_date,
          nil, # user2.double_job_experiences[0].employment_end_date,
          nil, # user2.double_job_experiences[0].business_experience,
          nil, # user2.double_job_experiences[1].company_name,
          nil, # user2.double_job_experiences[1].job_kind.name,
          nil, # user2.double_job_experiences[1].monthly_income,
          nil, # user2.double_job_experiences[1].working_hours,
          nil, # user2.double_job_experiences[1].employment_start_date,
          nil, # user2.double_job_experiences[1].employment_end_date,
          nil, # user2.double_job_experiences[1].business_experience,
          "exampleな自己紹介2\n以下自己紹介2", # user2.self_introduction.self_pr,
          "30", # user2.self_introduction.desired_unit_price,
          "40", # user2.self_introduction.desired_working_hours,
          "50", # user2.self_introduction.desired_working_days,
          "不可", # user2.self_introduction.in_person_meeting_i18n,
          "今は対応できない", # user2.self_introduction.handle_status_i18n,
          "今は対応できない", # user2.self_introduction.handle_conditions_i18n,
          "未登録", # user2.self_introduction.registered_invoice,
          nil, # user2.self_introduction.invoice_number,
          nil, # user2.self_introduction.portfolio,
          nil, # 以下スキル項目全て空文字
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
        ]
      end

      # NOTE: 会員登録を中断したユーザー
      let(:expected_csv_row_user3) do
        [
          user3.id.to_s,
          " ", # user3.full_name,
          " ", # user3.full_name_kana,
          nil, # user3.phone_number,
          nil, # user3.postal_code,
          nil, # user3.address,
          nil, # user3.gender_i18n,
          nil, # user3.birthday,
          nil, # user3.education_background.recent_academic_history_i18n,
          nil, # user3.education_background.school_name,
          nil, # user3.education_background.faculty_name,
          nil, # user3.education_background.graduated_year,
          nil, # user3. employment_status.status_i18n,
          nil, # user3. employment_status.company_name,
          nil, # user3. employment_status.industry_category,
          nil, # user3. employment_status.job_kind.name,
          nil, # user3. employment_status.job_title,
          nil, # user3. employment_status.yearly_income,
          "週日 1日時間", # user3. employment_status.working_hours, user3. employment_status.working_days_of_the_week
          nil, # user3. employment_status.business_experience,
          nil, # user3. employment_status.employment_start_date,
          nil, # user3. employment_status.employment_end_date,
          nil, # user3.past_employment_statuses[0].company_name,
          nil, # user3.past_employment_statuses[0].previous_client_or_industry,
          nil, # user3.past_employment_statuses[0].employment_start_date,
          nil, # user3.past_employment_statuses[0].employment_end_date,
          nil, # user3.past_employment_statuses[1].company_name,
          nil, # user3.past_employment_statuses[1].previous_client_or_industry,
          nil, # user3.past_employment_statuses[1].employment_start_date,
          nil, # user3.past_employment_statuses[1].employment_end_date,
          "なし", # user3.second_job_experience,
          nil, # user3.double_job_experiences[0].company_name,
          nil, # user3.double_job_experiences[0].job_kind.name,
          nil, # user3.double_job_experiences[0].monthly_income,
          nil, # user3.double_job_experiences[0].working_hours,
          nil, # user3.double_job_experiences[0].employment_start_date,
          nil, # user3.double_job_experiences[0].employment_end_date,
          nil, # user3.double_job_experiences[0].business_experience,
          nil, # user3.double_job_experiences[1].company_name,
          nil, # user3.double_job_experiences[1].job_kind.name,
          nil, # user3.double_job_experiences[1].monthly_income,
          nil, # user3.double_job_experiences[1].working_hours,
          nil, # user3.double_job_experiences[1].employment_start_date,
          nil, # user3.double_job_experiences[1].employment_end_date,
          nil, # user3.double_job_experiences[1].business_experience,
          nil, # user3.self_introduction.self_pr,
          nil, # user3.self_introduction.desired_unit_price,
          nil, # user3.self_introduction.desired_working_hours,
          nil, # user3.self_introduction.desired_working_days,
          nil, # user3.self_introduction.in_person_meeting_i18n,
          nil, # user3.self_introduction.handle_status_i18n,
          nil, # user3.self_introduction.handle_conditions_i18n,
          nil, # user3.self_introduction.registered_invoice,
          nil, # user3.self_introduction.invoice_number,
          nil, # user3.self_introduction.portfolio,
          nil, # 以下スキル項目全て空文字
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
          nil,
        ]
      end

      it %w[リクエストが成功すること
            csvヘッダーが定義されている通りであること
            csvの行がユーザーに紐づく値であること].join(", ") do
        subject

        expect(response).to have_http_status(:ok)
        # BOM付きのCSVをパースする
        rows = CSV.parse(response.body.delete("\uFEFF"), headers: true).map(&:to_h)
        expect(rows[0].keys).to eq expected_csv_header
        # user1
        expect(rows[0].values).to eq expected_csv_row_user1
        # user2
        expect(rows[1].values).to eq expected_csv_row_user2
        # user3
        expect(rows[2].values).to eq expected_csv_row_user3
      end
    end
  end
end
