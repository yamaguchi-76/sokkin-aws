# frozen_string_literal: true

unless Rails.env.production?
  namespace :change_user_attributes do
    desc "ユーザー検索用に様々な属性を持ったユーザーを作成する"
    task :run, ["from", "to"] => :environment do |t, args|
      # NOTE: STG環境でテストユーザーをランダムに作成するために実装したrake task
      #       メールアドレスの一意制約等考慮せずにDBをリセットしてUserを入れ直す前提の実装のため
      #       1件でもUserが存在する場合は実行しないよう安全柵を設けている
      return if User.count != 0

      puts "#ユーザーを作成する"
      desired_unit_price_array = 500.step(by: 500, to: 10000).to_a
      desired_working_hours_array = (1..24).to_a
      desired_working_days_array = (1..31).to_a
      handle_conditions_array = (0..2).to_a
      handle_status_array = (0..3).to_a
      job_kinds_array = JobKind.all.ids
      now = Time.current
      users = []
      [1960, 1970, 1980, 1990, 2000, 2010].each do |year|
        puts "#{year}-#{year + 1}年生まれのユーザーを作成"
        (year..year + 1).each do |birthyear|
          (1..12).each do |birthmonth|
            user = FactoryBot.create(:user, birthday: Time.new(birthyear, birthmonth))
            users << user
          end
        end
      end

      puts "EmploymentStatusを作成"
      employment_statuses = users.map do |user|
        FactoryBot.build(:employment_status,
                          user: user,
                          job_kind_id: job_kinds_array.sample,
                          status: (0..2).to_a.sample,
                          created_at: now,
                          updated_at: now).attributes
      end
      EmploymentStatus.insert_all(employment_statuses)

      puts "SelfIntroductionを作成"
      self_introductions = users.map do |user|
        FactoryBot.build(:self_introduction,
                          user: user,
                          desired_unit_price: desired_unit_price_array.sample,
                          desired_working_hours: desired_working_hours_array.sample,
                          desired_working_days: desired_working_days_array.sample,
                          handle_conditions: handle_conditions_array.sample,
                          handle_status: handle_status_array.sample,
                          created_at: now,
                          updated_at: now).attributes
      end
      SelfIntroduction.insert_all(self_introductions)

      puts "Skillを作成"
      skills_attributes = users.map do |user|
        FactoryBot.build(:skill,
                         user: user,
                         planner: true,
                         media_consultant: true,
                         operation_operator: true,
                         designer: true,
                         director: true,
                         engineer: true,
                         created_at: now,
                         updated_at: now).attributes
      end
      Skill.insert_all(skills_attributes)

      created_skills = Skill.all
      puts "各Skill scopeを作成"

      skills = {
        skill_search_scope: SearchScope.all.ids,
        skill_display_scope: DisplayScope.all.ids,
        skill_sns_scope: SnsScope.all.ids,
        skill_application_ad_scope: ApplicationAdScope.all.ids,
        skill_seo_scope: SeoScope.all.ids,
        skill_crm_scope: CrmScope.all.ids,
        skill_sns_owned_media_scope: SnsOwnedMediaScope.all.ids,
        skill_dsp_scope: DspScope.all.ids,
        skill_video_scope: VideoScope.all.ids,
        skill_affiliate_scope: AffiliateScope.all.ids,
        skill_sight_access_scope: SightAccessScope.all.ids,
        skill_ma_scope: MaScope.all.ids,
        skill_tag_manager_scope: TagManagerScope.all.ids,
        skill_feed_scope: FeedScope.all.ids,
        skill_third_party_scope: ThirdPartyScope.all.ids,
        skill_customer_scope: CustomerScope.all.ids,
        skill_business_scope: BusinessScope.all.ids,
        skill_three_c_scope: ThreeCScope.all.ids,
        skill_four_p_scope: FourPScope.all.ids,
        skill_persona_scope: PersonaScope.all.ids,
        skill_user_survey_scope: UserSurveyScope.all.ids,
        skill_pr_scope: PrScope.all.ids,
        skill_customer_journey_scope: CustomerJourneyScope.all.ids,
        skill_language_scope: LanguageScope.all.ids,
        skill_kpi_scope: KpiScope.all.ids,
        skill_influencer_scope: InfluencerScope.all.ids,
        skill_writing_scope: WritingScope.all.ids,
        skill_website_scope: WebsiteScope.all.ids,
        skill_ecsite_scope: EcsiteScope.all.ids,
        skill_application_production_scope: ApplicationProductionScope.all.ids,
        skill_image_ad_scope: ImageAdScope.all.ids,
        skill_movie_ad_scope: MovieAdScope.all.ids,
        skill_new_business_scope: NewBusinessScope.all.ids,
      }.with_indifferent_access
      skills_count_range = (1..5).to_a
      created_skills.map do |skill|
        skill_count = skills_count_range.sample
        (1..32).to_a.sample(skill_count).each do |value_idx|
          key_name = skills.keys[value_idx]
          FactoryBot.create(key_name,
                            skill: skill,
                            (key_name.split("_")[1..-1].join("_") + "_id").to_sym => skills[key_name].sample)
        end
      end
    end
  end
end
