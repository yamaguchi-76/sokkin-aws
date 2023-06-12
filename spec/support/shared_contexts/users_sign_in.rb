# frozen_string_literal: true

RSpec.shared_context "toCユーザーでログイン", shared_context: :metadata do
  # 呼び出し元のテストで下記を定義すること
  # let!(:current_user) { create(:user, ログインしたいユーザーに設定するカラムの値) }
  before do
    sign_in current_user
  end
end
