# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/users/educational_backgrounds", type: :request do
  describe "PATCH /users/educational_backgrounds" do
    subject { patch users_educational_backgrounds_path, params: params }

    let!(:current_user) { create(:user) }

    include_context "toCユーザーでログイン"

    describe "更新後のリダイレクト先" do
      let!(:educational_background) do
        create(:educational_background,
               user: current_user,
               created_at: created_at,
               updated_at: updated_at)
      end

      let(:params) do
        {
          educational_background: {
            recent_academic_history: "junior_college_dropout",
            school_name: "example-school",
            faculty_name: "example-faculty",
            "graduated_year(1i)" => "2000",
            "graduated_year(2i)" => "1",
            "graduated_year(3i)" => "1",
          }
        }
      end

      context "1回も更新していない場合" do
        let(:created_at) { Time.zone.parse("2022-01-01 11:11:11") }
        let(:updated_at) { Time.zone.parse("2022-01-01 11:11:11") }

        it "就業状況編集にリダイレクトすること" do
          subject
          expect(response).to redirect_to edit_users_employment_statuses_url
        end
      end

      context "2回目以降の更新の場合" do
        let(:created_at) { Time.zone.parse("2022-01-01 11:11:11") }
        let(:updated_at) { Time.zone.parse("2022-02-02 22:22:22") }

        it "学歴詳細にリダイレクトすること" do
          subject
          expect(response).to redirect_to users_educational_backgrounds_url
        end
      end
    end
  end
end
