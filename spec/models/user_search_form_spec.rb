# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSearchForm do
  describe "#search" do
    subject { described_class.new(params).search }

    let!(:user_1) { create(:user) }
    let!(:user_2) { create(:user) }
    let!(:user_3) { create(:user) }

    before do
      freeze_time
    end

    context "職種のみで検索する場合" do
      let(:params) do
        {
          job_kind_ids: %w[1 2],
        }
      end

      before do
        job_kind_id_1 = JobKind.find(1)
        job_kind_id_2 = JobKind.find(2)
        job_kind_id_3 = JobKind.find(3)

        create(:employment_status, user: user_1, job_kind: job_kind_id_1)
        create(:employment_status, user: user_2, job_kind: job_kind_id_2)
        create(:employment_status, user: user_3, job_kind: job_kind_id_3)
      end

      it "職種が1と2のユーザーが取得できること" do
        expect(subject).to match_array([user_1, user_2])
      end
    end

    context "年齢のみで検索する場合" do
      before do
        user_1.update!(birthday: Date.today.ago(20.years)) # 20歳
        user_2.update!(birthday: Date.today.ago(21.years)) # 21歳
        user_3.update!(birthday: Date.today.ago(22.years)) # 22歳
      end

      context "gteq lteq が指定されている場合" do
        let(:params) do
          {
            age_gteq: 20,
            age_lteq: 20,
          }
        end

        before do
          # 明日で20歳になる19歳
          create(:user, birthday: 19.years.ago + 1.day)
        end

        it "年齢が20歳以上21歳以下のユーザーが取得できること" do
          expect(subject).to match_array([user_1])
        end
      end

      context "gteq が指定されている場合" do
        let(:params) do
          {
            age_gteq: 21,
          }
        end

        it "年齢が21歳以上のユーザーが取得できること" do
          expect(subject).to match_array([user_2, user_3])
        end
      end

      context "lteq が指定されている場合" do
        let(:params) do
          {
            age_lteq: 21,
          }
        end

        it "年齢が21歳以上のユーザーが取得できること" do
          expect(subject).to match_array([user_1, user_2])
        end
      end
    end

    context "希望単価のみで検索する場合" do
      before do
        create(:self_introduction, user: user_1, desired_unit_price: 1000)
        create(:self_introduction, user: user_2, desired_unit_price: 2000)
        create(:self_introduction, user: user_3, desired_unit_price: 3000)
      end

      context "gteq lteq が指定されている場合" do
        let(:params) do
          {
            desired_unit_price_gteq: 1000,
            desired_unit_price_lteq: 1900,
          }
        end

        it "希望単価が1000円以上1900円以下のユーザーが取得できること" do
          expect(subject).to match_array([user_1])
        end
      end

      context "gteq が指定されている場合" do
        let(:params) do
          {
            desired_unit_price_gteq: 3000,
          }
        end

        it "希望単価が3000円以上のユーザーが取得できること" do
          expect(subject).to match_array([user_3])
        end
      end

      context "lteq が指定されている場合" do
        let(:params) do
          {
            desired_unit_price_lteq: 1000,
          }
        end

        it "希望単価が1000円以下のユーザーが取得できること" do
          expect(subject).to match_array([user_1])
        end
      end
    end

    context "希望稼働時間のみで検索する場合" do
      before do
        create(:self_introduction, user: user_1, desired_working_hours: 2)
        create(:self_introduction, user: user_2, desired_working_hours: 4)
        create(:self_introduction, user: user_3, desired_working_hours: 6)
      end

      context "gteq lteq が指定されている場合" do
        let(:params) do
          {
            desired_working_hours_gteq: 2,
            desired_working_hours_lteq: 4,
          }
        end

        it "希望単価が1000円以上1900円以下のユーザーが取得できること" do
          expect(subject).to match_array([user_1, user_2])
        end
      end

      context "gteq が指定されている場合" do
        let(:params) do
          {
            desired_working_hours_gteq: 6,
          }
        end

        it "希望単価が3000円以上のユーザーが取得できること" do
          expect(subject).to match_array([user_3])
        end
      end

      context "lteq が指定されている場合" do
        let(:params) do
          {
            desired_working_hours_lteq: 2,
          }
        end

        it "希望単価が1000円以下のユーザーが取得できること" do
          expect(subject).to match_array([user_1])
        end
      end
    end

    context "希望稼働日数のみで検索する場合" do
      before do
        create(:self_introduction, user: user_1, desired_working_days: 1)
        create(:self_introduction, user: user_2, desired_working_days: 2)
        create(:self_introduction, user: user_3, desired_working_days: 3)
      end

      context "gteq lteq が指定されている場合" do
        let(:params) do
          {
            desired_working_days_gteq: 1,
            desired_working_days_lteq: 2,
          }
        end

        it "希望単価が1000円以上1900円以下のユーザーが取得できること" do
          expect(subject).to match_array([user_1, user_2])
        end
      end

      context "gteq が指定されている場合" do
        let(:params) do
          {
            desired_working_days_gteq: 3,
          }
        end

        it "希望単価が3000円以上のユーザーが取得できること" do
          expect(subject).to match_array([user_3])
        end
      end

      context "lteq が指定されている場合" do
        let(:params) do
          {
            desired_working_days_lteq: 1,
          }
        end

        it "希望単価が1000円以下のユーザーが取得できること" do
          expect(subject).to match_array([user_1])
        end
      end
    end

    context "就業状況のみで検索する場合" do
      let(:params) do
        {
          employment_statuses: ["0", "1"]
        }
      end

      before do
        create(:employment_status, user: user_1, status: :employee)
        create(:employment_status, user: user_2, status: :freelance)
        create(:employment_status, user: user_3, status: :others)
      end

      it "職種が0と1のユーザーが取得できること" do
        expect(subject).to match_array([user_1, user_2])
      end
    end

    context "対応ステータスのみで検索する場合" do
      let(:params) do
        {
          handle_statuses: ["0", "1"]
        }
      end

      before do
        create(:self_introduction, user: user_1, handle_status: :now)
        create(:self_introduction, user: user_2, handle_status: :good_proposition)
        create(:self_introduction, user: user_3, handle_status: :three_month)
        user_4 = create(:user)
        create(:self_introduction, user: user_4, handle_status: :no_status)
      end

      it "対応ステータスが0と1のユーザーが取得できること" do
        expect(subject).to match_array([user_1, user_2])
      end
    end

    context "対応条件のみで検索する場合" do
      let(:params) do
        {
          handle_conditions: ["0", "1"]
        }
      end

      before do
        create(:self_introduction, user: user_1, handle_conditions: :freelance)
        create(:self_introduction, user: user_2, handle_conditions: :double_job)
        create(:self_introduction, user: user_3, handle_conditions: :no_conditions)
      end

      it "対応条件が0と1のユーザーが取得できること" do
        expect(subject).to match_array([user_1, user_2])
      end
    end

    context "スキルのみで検索する場合" do
      let!(:user_1_skill) { create(:skill, user: user_1) }
      let!(:user_2_skill) { create(:skill, user: user_2) }
      let!(:user_3_skill) { create(:skill, user: user_3) }

      let!(:not_applicable_string) { "対応不可" }
      # NOTE: search_scopeなどのマスタデータに相当するレコードは
      #       seedデータをrspecでも使えるようにするべきだが、このテスト内でしか使わないことと、時間の関係上からテスト内で作成する

      let!(:test_search_scope) { SearchScope.where.not(answer: not_applicable_string).sample }
      let!(:non_applicable_test_search_scope) { SearchScope.find_by(answer: not_applicable_string) }

      describe "search_scope" do
        let(:params) do
          {
            skills: [0]
          }
        end

        before do
          # user1: 対応不可以外
          create(:skill_search_scope, skill: user_1_skill, search_scope: test_search_scope)
          # user2: 対応不可のみ
          create(:skill_search_scope, skill: user_2_skill, search_scope: non_applicable_test_search_scope)
          # user3: 対応不可を含む
          create(:skill_search_scope, skill: user_3_skill, search_scope: test_search_scope)
          create(:skill_search_scope, skill: user_3_skill, search_scope: non_applicable_test_search_scope)
          # user4: skill_search_scopes(中間テーブル)のレコードを持っていない
          user4 = create(:user)
          create(:skill, user: user4)
          # user5: スキルが存在しない
          create(:user)
        end

        it "対応不可以外のユーザーが取得できること" do
          expect(subject).to match_array([user_1])
        end
      end

      describe "全スキル複合" do
        # 全てのスキルを選択している かつ 対応不可と回答していないユーザーのみ取得
        let(:params) do
          {
            skills: described_class::SKILLS.values
          }
        end

        before do
          test_display_scope = DisplayScope.where.not(answer: not_applicable_string).sample
          test_sns_scope = SnsScope.where.not(answer: not_applicable_string).sample
          test_application_ad_scope = ApplicationAdScope.where.not(answer: not_applicable_string).sample
          test_seo_scope = SeoScope.where.not(answer: not_applicable_string).sample
          test_crm_scope = CrmScope.where.not(answer: not_applicable_string).sample
          test_sns_owned_media_scope = SnsOwnedMediaScope.where.not(answer: not_applicable_string).sample
          test_dsp_scope = DspScope.where.not(answer: not_applicable_string).sample
          test_video_scope = VideoScope.where.not(answer: not_applicable_string).sample
          test_affiliate_scope = AffiliateScope.where.not(answer: not_applicable_string).sample
          test_sight_access_scope = SightAccessScope.where.not(answer: not_applicable_string).sample
          test_ma_scope = MaScope.where.not(answer: not_applicable_string).sample
          test_tag_manager_scope = TagManagerScope.where.not(answer: not_applicable_string).sample
          test_feed_scope = FeedScope.where.not(answer: not_applicable_string).sample
          test_third_party_scope = ThirdPartyScope.where.not(answer: not_applicable_string).sample
          test_customer_scope = CustomerScope.where.not(answer: not_applicable_string).sample
          test_business_scope = BusinessScope.where.not(answer: not_applicable_string).sample
          test_three_c_scope = ThreeCScope.where.not(answer: not_applicable_string).sample
          test_four_p_scope = FourPScope.where.not(answer: not_applicable_string).sample
          test_persona_scope = PersonaScope.where.not(answer: not_applicable_string).sample
          test_user_survey_scope = UserSurveyScope.where.not(answer: not_applicable_string).sample
          test_pr_scope = PrScope.where.not(answer: not_applicable_string).sample
          test_customer_journey_scope = CustomerJourneyScope.where.not(answer: not_applicable_string).sample
          test_language_scope = LanguageScope.where.not(answer: not_applicable_string).sample
          test_kpi_scope = KpiScope.where.not(answer: not_applicable_string).sample
          test_influencer_scope = InfluencerScope.where.not(answer: not_applicable_string).sample
          test_writing_scope = WritingScope.where.not(answer: not_applicable_string).sample
          test_website_scope = WebsiteScope.where.not(answer: not_applicable_string).sample
          test_ecsite_scope = EcsiteScope.where.not(answer: not_applicable_string).sample
          test_application_production_scope = ApplicationProductionScope.where.not(answer: not_applicable_string).sample
          test_image_ad_scope = ImageAdScope.where.not(answer: not_applicable_string).sample
          test_movie_ad_scope = MovieAdScope.where.not(answer: not_applicable_string).sample
          test_new_business_scope = NewBusinessScope.where.not(answer: not_applicable_string).sample

          # user1: 全てのスキルを対応不可以外で作成する
          create(:skill_search_scope, skill: user_1_skill, search_scope: test_search_scope)
          create(:skill_display_scope, skill: user_1_skill, display_scope: test_display_scope)
          create(:skill_sns_scope, skill: user_1_skill, sns_scope: test_sns_scope)
          create(:skill_application_ad_scope, skill: user_1_skill, application_ad_scope: test_application_ad_scope)
          create(:skill_seo_scope, skill: user_1_skill, seo_scope: test_seo_scope)
          create(:skill_crm_scope, skill: user_1_skill, crm_scope: test_crm_scope)
          create(:skill_sns_owned_media_scope, skill: user_1_skill, sns_owned_media_scope: test_sns_owned_media_scope)
          create(:skill_dsp_scope, skill: user_1_skill, dsp_scope: test_dsp_scope)
          create(:skill_video_scope, skill: user_1_skill, video_scope: test_video_scope)
          create(:skill_affiliate_scope, skill: user_1_skill, affiliate_scope: test_affiliate_scope)
          create(:skill_sight_access_scope, skill: user_1_skill, sight_access_scope: test_sight_access_scope)
          create(:skill_ma_scope, skill: user_1_skill, ma_scope: test_ma_scope)
          create(:skill_tag_manager_scope, skill: user_1_skill, tag_manager_scope: test_tag_manager_scope)
          create(:skill_feed_scope, skill: user_1_skill, feed_scope: test_feed_scope)
          create(:skill_third_party_scope, skill: user_1_skill, third_party_scope: test_third_party_scope)
          create(:skill_customer_scope, skill: user_1_skill, customer_scope: test_customer_scope)
          create(:skill_business_scope, skill: user_1_skill, business_scope: test_business_scope)
          create(:skill_three_c_scope, skill: user_1_skill, three_c_scope: test_three_c_scope)
          create(:skill_four_p_scope, skill: user_1_skill, four_p_scope: test_four_p_scope)
          create(:skill_persona_scope, skill: user_1_skill, persona_scope: test_persona_scope)
          create(:skill_user_survey_scope, skill: user_1_skill, user_survey_scope: test_user_survey_scope)
          create(:skill_pr_scope, skill: user_1_skill, pr_scope: test_pr_scope)
          create(:skill_customer_journey_scope, skill: user_1_skill, customer_journey_scope: test_customer_journey_scope)
          create(:skill_language_scope, skill: user_1_skill, language_scope: test_language_scope)
          create(:skill_kpi_scope, skill: user_1_skill, kpi_scope: test_kpi_scope)
          create(:skill_influencer_scope, skill: user_1_skill, influencer_scope: test_influencer_scope)
          create(:skill_writing_scope, skill: user_1_skill, writing_scope: test_writing_scope)
          create(:skill_website_scope, skill: user_1_skill, website_scope: test_website_scope)
          create(:skill_ecsite_scope, skill: user_1_skill, ecsite_scope: test_ecsite_scope)
          create(:skill_application_production_scope, skill: user_1_skill, application_production_scope: test_application_production_scope)
          create(:skill_image_ad_scope, skill: user_1_skill, image_ad_scope: test_image_ad_scope)
          create(:skill_movie_ad_scope, skill: user_1_skill, movie_ad_scope: test_movie_ad_scope)
          create(:skill_new_business_scope, skill: user_1_skill, new_business_scope: test_new_business_scope)

          # user2: user1とほとんど同じだが、1つだけ対応不可で作成する
          create(:skill_search_scope, skill: user_2_skill, search_scope: non_applicable_test_search_scope)
          create(:skill_display_scope, skill: user_2_skill, display_scope: test_display_scope)
          create(:skill_sns_scope, skill: user_2_skill, sns_scope: test_sns_scope)
          create(:skill_application_ad_scope, skill: user_2_skill, application_ad_scope: test_application_ad_scope)
          create(:skill_seo_scope, skill: user_2_skill, seo_scope: test_seo_scope)
          create(:skill_crm_scope, skill: user_2_skill, crm_scope: test_crm_scope)
          create(:skill_sns_owned_media_scope, skill: user_2_skill, sns_owned_media_scope: test_sns_owned_media_scope)
          create(:skill_dsp_scope, skill: user_2_skill, dsp_scope: test_dsp_scope)
          create(:skill_video_scope, skill: user_2_skill, video_scope: test_video_scope)
          create(:skill_affiliate_scope, skill: user_2_skill, affiliate_scope: test_affiliate_scope)
          create(:skill_sight_access_scope, skill: user_2_skill, sight_access_scope: test_sight_access_scope)
          create(:skill_ma_scope, skill: user_2_skill, ma_scope: test_ma_scope)
          create(:skill_tag_manager_scope, skill: user_2_skill, tag_manager_scope: test_tag_manager_scope)
          create(:skill_feed_scope, skill: user_2_skill, feed_scope: test_feed_scope)
          create(:skill_third_party_scope, skill: user_2_skill, third_party_scope: test_third_party_scope)
          create(:skill_customer_scope, skill: user_2_skill, customer_scope: test_customer_scope)
          create(:skill_business_scope, skill: user_2_skill, business_scope: test_business_scope)
          create(:skill_three_c_scope, skill: user_2_skill, three_c_scope: test_three_c_scope)
          create(:skill_four_p_scope, skill: user_2_skill, four_p_scope: test_four_p_scope)
          create(:skill_persona_scope, skill: user_2_skill, persona_scope: test_persona_scope)
          create(:skill_user_survey_scope, skill: user_2_skill, user_survey_scope: test_user_survey_scope)
          create(:skill_pr_scope, skill: user_2_skill, pr_scope: test_pr_scope)
          create(:skill_customer_journey_scope, skill: user_2_skill, customer_journey_scope: test_customer_journey_scope)
          create(:skill_language_scope, skill: user_2_skill, language_scope: test_language_scope)
          create(:skill_kpi_scope, skill: user_2_skill, kpi_scope: test_kpi_scope)
          create(:skill_influencer_scope, skill: user_2_skill, influencer_scope: test_influencer_scope)
          create(:skill_writing_scope, skill: user_2_skill, writing_scope: test_writing_scope)
          create(:skill_website_scope, skill: user_2_skill, website_scope: test_website_scope)
          create(:skill_ecsite_scope, skill: user_2_skill, ecsite_scope: test_ecsite_scope)
          create(:skill_application_production_scope, skill: user_2_skill, application_production_scope: test_application_production_scope)
          create(:skill_image_ad_scope, skill: user_2_skill, image_ad_scope: test_image_ad_scope)
          create(:skill_movie_ad_scope, skill: user_2_skill, movie_ad_scope: test_movie_ad_scope)
          create(:skill_new_business_scope, skill: user_2_skill, new_business_scope: test_new_business_scope)
          # user3: 1つだけスキルを作成する
          create(:skill_new_business_scope, skill: user_3_skill, new_business_scope: test_new_business_scope)
          # user4: skill_search_scopes(中間テーブル)のレコードを持っていない
          user4 = create(:user)
          create(:skill, user: user4)
          # user5: スキルが存在しない
          create(:user)
        end

        it "user_1が取得できること" do
          expect(subject).to match_array([user_1])
        end
      end
    end

    context "複合条件で検索した場合" do
      # NOTE: 複合条件でuser_1, user_2が取得できるような条件を設定する
      let(:params) do
        {
          job_kind_ids: %w[1 2],
          age_gteq: 20,
          age_lteq: 21,
          desired_unit_price_gteq: 1000,
          desired_unit_price_lteq: 2000,
          desired_working_hours_gteq: 2,
          desired_working_hours_lteq: 4,
          desired_working_days_gteq: 3,
          desired_working_days_lteq: 5,
          employment_statuses: %w[0 1],
          handle_statuses: %w[0 1],
          handle_conditions: %w[0 1],
        }
      end

      before do
        # 職種, 就業状況のセットアップ
        job_kind_id_1 = JobKind.find(1)
        job_kind_id_2 = JobKind.find(2)
        job_kind_id_3 = JobKind.find(3)

        create(:employment_status, user: user_1, job_kind: job_kind_id_1, status: :employee)
        create(:employment_status, user: user_2, job_kind: job_kind_id_2, status: :freelance)
        create(:employment_status, user: user_3, job_kind: job_kind_id_3, status: :others)

        # 年齢のセットアップ
        user_1.update!(birthday: Date.today.ago(20.years)) # 20歳
        user_2.update!(birthday: Date.today.ago(21.years)) # 21歳
        user_3.update!(birthday: Date.today.ago(22.years)) # 22歳

        # 希望単価、希望稼働時間、希望稼働日数のセットアップ
        create(:self_introduction,
               user: user_1,
               desired_unit_price: 1000,
               desired_working_hours: 2,
               desired_working_days: 3,
               handle_status: :now,
               handle_conditions: :freelance)
        create(:self_introduction,
               user: user_2,
               desired_unit_price: 2000,
               desired_working_hours: 4,
               desired_working_days: 5,
               handle_status: :good_proposition,
               handle_conditions: :double_job)
        create(:self_introduction, user: user_3, desired_unit_price: 3000, desired_working_hours: 6, desired_working_days: 7)
      end

      it "user_1とuser_2が取得できること" do
        expect(subject).to match_array([user_1, user_2])
      end
    end

    context "全てを空で検索した場合" do
      let(:params) do
        {}
      end

      it "全てのユーザーが取得できること" do
        expect(subject).to match_array([user_1, user_2, user_3])
      end
    end
  end
end
