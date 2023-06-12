# frozen_string_literal: true

RSpec.shared_context "current_userを案件応募可能な状態に設定", shared_context: :metadata do
  # 呼び出し元のテストで下記を定義すること
  # let!(:current_user) { create(:user, ログインしたいユーザーに設定するカラムの値) }
  before do
    allow(current_user.educational_background).to receive(:registered?).and_return(true)
    allow(current_user.employment_status).to receive(:registered?).and_return(true)
    allow(current_user.self_introduction).to receive(:registered?).and_return(true)
    allow(current_user.skill).to receive(:registered?).and_return(true)
  end
end
