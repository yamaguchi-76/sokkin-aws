class RemoveColumnSkills < ActiveRecord::Migration[6.1]
  def up
    remove_column :skills, :search_scope
    remove_column :skills, :display_scope
    remove_column :skills, :sns_scope
    remove_column :skills, :application_ad_scope
    remove_column :skills, :seo_scope
    remove_column :skills, :crm_scope
    remove_column :skills, :sns_owned_media_scope
    remove_column :skills, :dsp_scope
    remove_column :skills, :video_scope
    remove_column :skills, :affiliate_scope
    remove_column :skills, :sight_access_scope
    remove_column :skills, :ma_scope
    remove_column :skills, :tag_manager_scope
    remove_column :skills, :feed_scope
    remove_column :skills, :third_party_scope
    remove_column :skills, :customer_scope
    remove_column :skills, :business_scope
    remove_column :skills, :three_c_scope
    remove_column :skills, :four_p_scope
    remove_column :skills, :persona_scope
    remove_column :skills, :user_survey_scope
    remove_column :skills, :pr_scope
    remove_column :skills, :customer_journey_scope
    remove_column :skills, :language_scope
    remove_column :skills, :kpi_scope
    remove_column :skills, :influencer_scope
    remove_column :skills, :writing_scope
    remove_column :skills, :website_scope
    remove_column :skills, :ecsite_scope
    remove_column :skills, :application_production_scope
    remove_column :skills, :image_ad_scope
    remove_column :skills, :movie_ad_scope
    remove_column :skills, :new_business_scope
  end

  def down
    add_column :skills, :search_scope
    add_column :skills, :display_scope
    add_column :skills, :sns_scope
    add_column :skills, :application_ad_scope
    add_column :skills, :seo_scope
    add_column :skills, :crm_scope
    add_column :skills, :sns_owned_media_scope
    add_column :skills, :dsp_scope
    add_column :skills, :video_scope
    add_column :skills, :affiliate_scope
    add_column :skills, :sight_access_scope
    add_column :skills, :ma_scope
    add_column :skills, :tag_manager_scope
    add_column :skills, :feed_scope
    add_column :skills, :third_party_scope
    add_column :skills, :customer_scope
    add_column :skills, :business_scope
    add_column :skills, :three_c_scope
    add_column :skills, :four_p_scope
    add_column :skills, :persona_scope
    add_column :skills, :user_survey_scope
    add_column :skills, :pr_scope
    add_column :skills, :customer_journey_scope
    add_column :skills, :language_scope
    add_column :skills, :kpi_scope
    add_column :skills, :influencer_scope
    add_column :skills, :writing_scope
    add_column :skills, :website_scope
    add_column :skills, :ecsite_scope
    add_column :skills, :application_production_scope
    add_column :skills, :image_ad_scope
    add_column :skills, :movie_ad_scope
    add_column :skills, :new_business_scope
  end
end
