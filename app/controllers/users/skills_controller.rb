# frozen_string_literal: true

module Users
  class SkillsController < ApplicationController
    def edit
      @skill = current_user.skill
    end

    def update
      @skill = current_user.skill
      if @skill.update(skill_params.merge(update_count: 1)) # 現状0or1しか見ていないため一律で1にする
        redirect_to complete_users_skills_path
      else
        render "new"
      end
    end

    def skill_diagnose
      @skill = current_user.skill
    end

    def skill_diagnose_create
      if skill_diagnose_create_params.blank?
        render "skill_diagnose"
        return
      end

      @skill = current_user.build_skill(skill_diagnose_create_params)
      if @skill.save
        redirect_to edit_users_skill_path(@skill)
      else
        render "skill_diagnose"
      end
    end

    def skill_diagnose_edit
      @skill = current_user.skill
    end

    def skill_diagnose_update
      @skill = current_user.skill
      if @skill.update(formatted_skill_diagnose_update_params)
        redirect_to edit_users_skill_path(@skill)
      else
        render "skill_diagnose"
      end
    end

    private
      def skill_diagnose_create_params
        params.permit(:planner, :media_consultant, :operation_operator, :designer, :director, :engineer)
      end

      def skill_diagnose_update_params
        params.fetch(:skill, {}).permit(:planner, :media_consultant, :operation_operator, :designer, :director, :engineer)
      end

      def formatted_skill_diagnose_update_params
        skill_diagnose_update_params.merge(
          {
            planner: skill_diagnose_update_params[:planner].present?,
            media_consultant: skill_diagnose_update_params[:media_consultant].present?,
            operation_operator: skill_diagnose_update_params[:operation_operator].present?,
            designer: skill_diagnose_update_params[:designer].present?,
            director: skill_diagnose_update_params[:director].present?,
            engineer: skill_diagnose_update_params[:engineer].present?,
          },
        )
      end

      def skill_params
        params.require(:skill).permit(
          :search_experience,
          :display_experience,
          :sns_experience,
          :application_ad_experience,
          :seo_experience,
          :crm_experience,
          :sns_owned_media_experience,
          :dsp_experience,
          :video_experience,
          :affiliate_experience,
          :sight_access_experience,
          :ma_experience,
          :tag_manager_experience,
          :feed_experience,
          :third_party_experience,
          :customer_experience,
          :business_experience,
          :three_c_experience,
          :four_p_experience,
          :persona_experience,
          :user_survey_experience,
          :pr_experience,
          :customer_journey_experience,
          :language_experience,
          :kpi_experience,
          :influencer_experience,
          :writing_experience,
          :website_experience,
          :ecsite_experience,
          :application_production_experience,
          :image_ad_experience,
          :movie_ad_experience,
          :new_business_experience,
          search_scope_ids: [],
          display_scope_ids: [],
          sns_scope_ids: [],
          application_ad_scope_ids: [],
          seo_scope_ids: [],
          crm_scope_ids: [],
          sns_owned_media_scope_ids: [],
          dsp_scope_ids: [],
          video_scope_ids: [],
          affiliate_scope_ids: [],
          sight_access_scope_ids: [],
          ma_scope_ids: [],
          tag_manager_scope_ids: [],
          feed_scope_ids: [],
          third_party_scope_ids: [],
          customer_scope_ids: [],
          business_scope_ids: [],
          three_c_scope_ids: [],
          four_p_scope_ids: [],
          persona_scope_ids: [],
          user_survey_scope_ids: [],
          pr_scope_ids: [],
          customer_journey_scope_ids: [],
          language_scope_ids: [],
          kpi_scope_ids: [],
          influencer_scope_ids: [],
          writing_scope_ids: [],
          website_scope_ids: [],
          ecsite_scope_ids: [],
          application_production_scope_ids: [],
          image_ad_scope_ids: [],
          movie_ad_scope_ids: [],
          new_business_scope_ids: [],
        )
      end
  end
end
