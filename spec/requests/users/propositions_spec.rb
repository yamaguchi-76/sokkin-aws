# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/users/propositions", type: :request do
  describe "POST /:id/entry" do
    subject { post entry_users_proposition_path(proposition.id), params: params }

    let!(:current_user) { create(:user, :with_has_one_records, :with_skill) }
    let!(:proposition) { create(:proposition) }

    let(:params) do
      {
        proposition_entry: {
          estimated_work_time: 1,
          request: "ごようぼう"
        }
      }
    end

    include_context "toCユーザーでログイン"

    context "案件応募可能なユーザーの場合" do
      include_context "current_userを案件応募可能な状態に設定"

      before do
        allow_any_instance_of(PropositionEntryMailer).to receive(:complete_entry).and_return(true)
      end

      context "ログインユーザーの対象案件に対するentryが存在しない場合" do
        before do
          # テスト対象でない案件に対するの応募を作る
          create(:proposition_entry, :before_interview, user_id: current_user.id)
        end

        it %w[リダイレクトする entryレコードが作成される].join(", ") do
          subject

          expect(response).to redirect_to(complete_users_proposition_path)
          expect(PropositionEntry.where(user: current_user).count).to eq 2
          expect(current_user.reload.proposition_entries.last).to have_attributes(estimated_work_time: 1,
                                                                                  request: "ごようぼう")
        end

        context "他のユーザーのentryが存在する場合" do
          before do
            create(:proposition_entry, :before_interview, proposition: proposition)
          end

          it %w[リダイレクトする entryレコードが作成される].join(", ") do
            subject

            expect(response).to redirect_to(complete_users_proposition_path)
            expect(PropositionEntry.where(user: current_user).count).to eq 2
            expect(current_user.reload.proposition_entries.last).to have_attributes(estimated_work_time: 1,
                                                                                    request: "ごようぼう")
          end
        end
      end

      context "ログインユーザーの対象案件に対するentryが存在する場合" do
        before do
          create(:proposition_entry, :before_interview, proposition: proposition, user: current_user, estimated_work_time: 2, request: "既存のレコード")
        end

        it %w[404エラー].join(", ") do
          subject

          expect(response).to have_http_status 404
        end

        it %w[entryレコードが作成されない].join(", ") do
          expect { subject rescue nil }.not_to change { PropositionEntry.where(user: current_user).count }
        end
      end
    end

    context "案件応募不可なユーザーの場合" do
      it %w[プロフィール入力を促す画面へリダイレクトする entryレコードが作成されない].join(", ") do
        subject

        expect(response).to redirect_to(users_need_initial_setting_path)
        expect(PropositionEntry.where(user: current_user).count).to eq 0
      end
    end
  end
end
