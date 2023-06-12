# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/users/self_introductions", type: :request do
  describe "PATCH /users/self_introductions" do
    subject { patch users_self_introductions_path, params: params }

    let!(:current_user) { create(:user) }

    include_context "toCユーザーでログイン"

    describe "更新後のリダイレクト先" do
      let!(:self_introduction) do
        create(:self_introduction,
               user: current_user,
               created_at: created_at,
               updated_at: updated_at)
      end

      let(:params) do
        {
          self_introduction: {
            "self_pr" => "aaa",
            "desired_unit_price" => "1",
            "desired_working_hours" => "2",
            "desired_working_days" => "3",
            "in_person_meeting" => "possible",
            "handle_status" => "now",
            "handle_conditions" => "freelance",
            "portfolio" => "bbb"
          }
        }
      end

      context "1回も更新していない場合" do
        let(:created_at) { Time.zone.parse("2022-01-01 11:11:11") }
        let(:updated_at) { Time.zone.parse("2022-01-01 11:11:11") }

        it "自己紹介詳細にリダイレクトすること" do
          subject
          expect(response).to redirect_to users_self_introductions_url
        end
      end

      context "2回目以降の更新の場合" do
        let(:created_at) { Time.zone.parse("2022-01-01 11:11:11") }
        let(:updated_at) { Time.zone.parse("2022-02-02 22:22:22") }

        it "自己紹介詳細にリダイレクトすること" do
          subject
          expect(response).to redirect_to users_self_introductions_url
        end
      end
    end
  end
end
