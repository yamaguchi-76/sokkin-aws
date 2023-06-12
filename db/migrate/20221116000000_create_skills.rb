class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.boolean :planner
      t.boolean :media_consultant
      t.boolean :operation_operator
      t.boolean :designer
      t.boolean :director
      t.boolean :engineer
      t.integer :search_scope
      t.integer :search_experience
      t.integer :display_scope
      t.integer :display_experience
      t.integer :sns_scope
      t.integer :sns_experience
      t.integer :application_ad_scope
      t.integer :application_ad_experience
      t.integer :seo_scope
      t.integer :seo_experience
      t.integer :crm_scope
      t.integer :crm_experience
      t.integer :sns_owned_media_scope
      t.integer :sns_owned_media_experience
      t.integer :dsp_scope
      t.integer :dsp_experience
      t.integer :video_scope
      t.integer :video_experience
      t.integer :affiliate_scope
      t.integer :affiliate_experience
      t.integer :sight_access_scope
      t.integer :sight_access_experience
      t.integer :ma_scope
      t.integer :ma_experience
      t.integer :tag_manager_scope
      t.integer :tag_manager_experience
      t.integer :feed_scope
      t.integer :feed_experience
      t.integer :third_party_scope
      t.integer :third_party_experience
      t.integer :customer_scope
      t.integer :customer_experience
      t.integer :business_scope
      t.integer :business_experience
      t.integer :three_c_scope
      t.integer :three_c_experience
      t.integer :four_p_scope
      t.integer :four_p_experience
      t.integer :persona_scope
      t.integer :persona_experience
      t.integer :user_survey_scope
      t.integer :user_survey_experience
      t.integer :pr_scope
      t.integer :pr_experience
      t.integer :customer_journey_scope
      t.integer :customer_journey_experience
      t.integer :language_scope
      t.integer :language_experience
      t.integer :kpi_scope
      t.integer :kpi_experience
      t.integer :influencer_scope
      t.integer :influencer_experience
      t.integer :writing_scope
      t.integer :writing_experience
      t.integer :website_scope
      t.integer :website_experience
      t.integer :ecsite_scope
      t.integer :ecsite_experience
      t.integer :application_production_scope
      t.integer :application_production_experience
      t.integer :image_ad_scope
      t.integer :image_ad_experience
      t.integer :movie_ad_scope
      t.integer :movie_ad_experience
      t.integer :new_business_scope
      t.integer :new_business_experience
      t.references :user, null: false, foreign_key: true, index: {unique: true}

      t.timestamps
    end
  end
end
