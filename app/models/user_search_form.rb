# frozen_string_literal: true

class UserSearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :job_kind_ids, array: true
  attribute :age_gteq, :integer
  attribute :age_lteq, :integer
  attribute :desired_unit_price_gteq, :integer
  attribute :desired_unit_price_lteq, :integer
  attribute :desired_working_hours_gteq, :integer
  attribute :desired_working_hours_lteq, :integer
  attribute :desired_working_days_gteq, :integer
  attribute :desired_working_days_lteq, :integer
  attribute :employment_statuses, array: true
  attribute :handle_statuses, array: true
  attribute :handle_conditions, array: true
  attribute :skills, array: true

  SKILLS = {
    search_scopes: 0,
    display_scopes: 1,
    sns_scopes: 2,
    application_ad_scopes: 3,
    seo_scopes: 4,
    crm_scopes: 5,
    sns_owned_media_scopes: 6,
    dsp_scopes: 7,
    video_scopes: 8,
    affiliate_scopes: 9,
    sight_access_scopes: 10,
    ma_scopes: 11,
    tag_manager_scopes: 12,
    feed_scopes: 13,
    third_party_scopes: 14,
    customer_scopes: 15,
    business_scopes: 16,
    three_c_scopes: 17,
    four_p_scopes: 18,
    persona_scopes: 19,
    user_survey_scopes: 20,
    pr_scopes: 21,
    customer_journey_scopes: 22,
    language_scopes: 23,
    kpi_scopes: 24,
    influencer_scopes: 25,
    writing_scopes: 26,
    website_scopes: 27,
    ecsite_scopes: 28,
    application_production_scopes: 29,
    image_ad_scopes: 30,
    movie_ad_scopes: 31,
    new_business_scopes: 32,
  }.with_indifferent_access

  def search
    base_relation
      .yield_self(&method(:matching_job_kind))
      .yield_self(&method(:matching_age_range))
      .yield_self(&method(:matching_desired_unit_price_range))
      .yield_self(&method(:matching_desired_working_hours_range))
      .yield_self(&method(:matching_desired_working_days_range))
      .yield_self(&method(:matching_employment_statuses))
      .yield_self(&method(:matching_handle_statuses))
      .yield_self(&method(:matching_handle_conditions))
      .yield_self(&method(:matching_skill))
      .distinct
  end

  private
    # NOTE: 知識の集約と再利用性の低さから、各modelのscopeに切り出すことはしなかった

    def base_relation
      # NOTE: employment_status, self_introductionレコードは
      #       ユーザーの会員登録状況によって存在しない場合もあるためinner joinにしなかった
      User.left_joins(:employment_status, :self_introduction)
    end

    def matching_job_kind(relation)
      formatted_job_kind_ids = job_kind_ids&.compact_blank
      return relation if formatted_job_kind_ids.blank?

      relation.merge(EmploymentStatus.where(job_kind_id: formatted_job_kind_ids))
    end

    def matching_age_range(relation)
      return relation if age_gteq.blank? && age_lteq.blank?

      date_from = age_lteq.blank? ? today.ago(200.years) : today.ago((age_lteq + 1).years).since(1.day)
      date_to = age_gteq.blank? ? today : today.ago(age_gteq.years)

      relation.where(birthday: date_from..date_to)
    end

    def matching_desired_unit_price_range(relation)
      return relation if desired_unit_price_gteq.blank? && desired_unit_price_lteq.blank?

      price_from = formatted_from(desired_unit_price_gteq)
      price_to = formatted_to(desired_unit_price_lteq)

      relation.merge(SelfIntroduction.where(desired_unit_price: price_from..price_to))
    end

    def matching_desired_working_hours_range(relation)
      return relation if desired_working_hours_gteq.blank? && desired_working_hours_lteq.blank?

      hours_from = formatted_from(desired_working_hours_gteq)
      hours_to = formatted_to(desired_working_hours_lteq)

      relation.merge(SelfIntroduction.where(desired_working_hours: hours_from..hours_to))
    end

    def matching_desired_working_days_range(relation)
      return relation if desired_working_days_gteq.blank? && desired_working_days_lteq.blank?

      days_from = formatted_from(desired_working_days_gteq)
      days_to = formatted_to(desired_working_days_lteq)

      relation.merge(SelfIntroduction.where(desired_working_days: days_from..days_to))
    end

    def formatted_from(value)
      value.presence || Float::MIN
    end

    def formatted_to(value)
      value.presence || Float::INFINITY
    end

    def matching_employment_statuses(relation)
      formatted_employment_statuses = employment_statuses&.compact_blank
      return relation if formatted_employment_statuses.blank?

      relation.merge(EmploymentStatus.where(status: formatted_employment_statuses))
    end

    def matching_handle_statuses(relation)
      formatted_handle_statuses = handle_statuses&.compact_blank
      return relation if formatted_handle_statuses.blank?

      relation.merge(SelfIntroduction.where(handle_status: formatted_handle_statuses))
    end

    def matching_handle_conditions(relation)
      formatted_handle_conditions = handle_conditions&.compact_blank
      return relation if formatted_handle_conditions.blank?

      relation.merge(SelfIntroduction.where(handle_conditions: formatted_handle_conditions))
    end

    def matching_skill(relation)
      formatted_skills = skills&.compact_blank
      return relation if formatted_skills.blank?

      exclude_skill_ids = formatted_skills.map do |skill|
        skill_name = SKILLS.key(skill.to_i)
        next unless skill_name

        associate_name = skill_name.to_sym

        excluded_skill_ids = Skill.where.missing("skill_#{skill_name}".to_sym).ids
        excluded_skill_ids2 = Skill.joins(associate_name)
                                   .where(associate_name => { answer: "対応不可" }).pluck(:id)

        excluded_skill_ids + excluded_skill_ids2
      end.flatten.uniq

      relation.joins(:skill).where.not(skill: { id: exclude_skill_ids })
    end

    def today
      @today ||= Date.today
    end
end
