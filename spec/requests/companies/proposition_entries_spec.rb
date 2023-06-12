# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/companies/proposition_entries", type: :request do
  describe "GET /index" do
    subject { get companies_proposition_entries_path }

    include_context "toBユーザーでログイン"

    let!(:current_company) { create(:company) }
    let!(:proposition) { create(:proposition, company: current_company) }
    let!(:entry) do
      create(:proposition_entry,
             proposition: proposition,
             request: "expected-test-request-text")
    end


    before do
      other_company = create(:company)
      other_proposition = create(:proposition, company: other_company)
      create(:proposition_entry, proposition: other_proposition, request: "other-request1")
      create(:proposition_entry, proposition: other_proposition, request: "other-request2")
    end

    it %w[リクエストした企業の案件に紐づく応募のみ取得できること].join(", ") do
      subject

      expect(response.body).to include "expected-test-request-text"
      expect(response.body).not_to include "other-request1"
      expect(response.body).not_to include "other-request2"
    end
  end
end
