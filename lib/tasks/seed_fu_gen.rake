# frozen_string_literal: true

namespace :seed_fu_gen do
  desc "generate seed-fu file for db."
  task skills: :environment do |t|
    SeedFu::Writer.write("./db/fixtures/test/search_scope.rb", class_name: "SearchScope", seed_type: :seed_once) do |w|
      SearchScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/display_scope.rb", class_name: "DisplayScope", seed_type: :seed_once) do |w|
      DisplayScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/sns_scope.rb", class_name: "SnsScope", seed_type: :seed_once) do |w|
      SnsScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/application_ad_scope.rb", class_name: "ApplicationAdScope", seed_type: :seed_once) do |w|
      ApplicationAdScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/seo_scope.rb", class_name: "SeoScope", seed_type: :seed_once) do |w|
      SeoScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/crm_scope.rb", class_name: "CrmScope", seed_type: :seed_once) do |w|
      CrmScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/sns_owned_media_scope.rb", class_name: "SnsOwnedMediaScope", seed_type: :seed_once) do |w|
      SnsOwnedMediaScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/dsp_scope.rb", class_name: "DspScope", seed_type: :seed_once) do |w|
      DspScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/video_scope.rb", class_name: "VideoScope", seed_type: :seed_once) do |w|
      VideoScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/affiliate_scope.rb", class_name: "AffiliateScope", seed_type: :seed_once) do |w|
      AffiliateScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/sight_access_scope.rb", class_name: "SightAccessScope", seed_type: :seed_once) do |w|
      SightAccessScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/ma_scope.rb", class_name: "MaScope", seed_type: :seed_once) do |w|
      MaScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/tag_manager_scope.rb", class_name: "TagManagerScope", seed_type: :seed_once) do |w|
      TagManagerScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/feed_scope.rb", class_name: "FeedScope", seed_type: :seed_once) do |w|
      FeedScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/third_party_scope.rb", class_name: "ThirdPartyScope", seed_type: :seed_once) do |w|
      ThirdPartyScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/customer_scope.rb", class_name: "CustomerScope", seed_type: :seed_once) do |w|
      CustomerScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/business_scope.rb", class_name: "BusinessScope", seed_type: :seed_once) do |w|
      BusinessScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/three_c_scope.rb", class_name: "ThreeCScope", seed_type: :seed_once) do |w|
      ThreeCScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/four_p_scope.rb", class_name: "FourPScope", seed_type: :seed_once) do |w|
      FourPScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/persona_scope.rb", class_name: "PersonaScope", seed_type: :seed_once) do |w|
      PersonaScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/user_survey_scope.rb", class_name: "UserSurveyScope", seed_type: :seed_once) do |w|
      UserSurveyScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/pr_scope.rb", class_name: "PrScope", seed_type: :seed_once) do |w|
      PrScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/customer_journey_scope.rb", class_name: "CustomerJourneyScope", seed_type: :seed_once) do |w|
      CustomerJourneyScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/language_scope.rb", class_name: "LanguageScope", seed_type: :seed_once) do |w|
      LanguageScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/kpi_scope.rb", class_name: "KpiScope", seed_type: :seed_once) do |w|
      KpiScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/influencer_scope.rb", class_name: "InfluencerScope", seed_type: :seed_once) do |w|
      InfluencerScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/writing_scope.rb", class_name: "WritingScope", seed_type: :seed_once) do |w|
      WritingScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/website_scope.rb", class_name: "WebsiteScope", seed_type: :seed_once) do |w|
      WebsiteScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/ecsite_scope.rb", class_name: "EcsiteScope", seed_type: :seed_once) do |w|
      EcsiteScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/application_production_scope.rb", class_name: "ApplicationProductionScope", seed_type: :seed_once) do |w|
      ApplicationProductionScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/image_ad_scope.rb", class_name: "ImageAdScope", seed_type: :seed_once) do |w|
      ImageAdScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/movie_ad_scope.rb", class_name: "MovieAdScope", seed_type: :seed_once) do |w|
      MovieAdScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
    SeedFu::Writer.write("./db/fixtures/test/new_business_scope.rb", class_name: "NewBusinessScope", seed_type: :seed_once) do |w|
      NewBusinessScope.all.each do |x|
        w << x.as_json(except: [:created_at, :updated_at])
      end
    end
  end
end
