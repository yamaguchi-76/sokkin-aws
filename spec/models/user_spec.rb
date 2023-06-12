# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  address(住所)                       :string(255)
#  birthday(誕生日)                    :date
#  confirmation_sent_at                :datetime
#  confirmation_token                  :string(255)
#  confirmed_at                        :datetime
#  current_sign_in_at                  :datetime
#  current_sign_in_ip                  :string(255)
#  deleted_at                          :datetime
#  email                               :string(255)      default(""), not null
#  encrypted_password                  :string(255)      default(""), not null
#  first_name(名前)                    :string(255)
#  first_name_kana(名前カナ)           :string(255)
#  gender(性別)                        :integer
#  image(プロフィール画像)             :string(255)
#  last_name(名字)                     :string(255)
#  last_name_kana(名字カナ)            :string(255)
#  last_sign_in_at                     :datetime
#  last_sign_in_ip                     :string(255)
#  phone_number(電話番号)              :string(255)
#  postal_code(郵便番号)               :string(255)
#  remember_created_at                 :datetime
#  reset_password_sent_at              :datetime
#  reset_password_token                :string(255)
#  second_job_experience(複業経験有無) :boolean          default(FALSE)
#  sign_in_count                       :integer          default(0), not null
#  unconfirmed_email                   :string(255)
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  describe "validate" do
    context "create" do
      subject { user.save }

      let(:user) do
        build(:user,
              first_name: nil,
              first_name_kana: nil,
              last_name: nil,
              last_name_kana: nil,
              birthday: nil,
              phone_number: nil,
              postal_code: nil,
              address: nil,
              gender: nil)
      end

      it "deviseカラム以外のバリデーションが実行されないこと" do
        expect(subject).to eq true
      end
    end

    context "update" do
      subject { user.update(update_user_attributes) }

      let!(:user) { create(:user) }
      let(:update_user_attributes) do
        {
          first_name: nil,
          first_name_kana: nil,
          last_name: nil,
          last_name_kana: nil,
          birthday: nil,
          phone_number: nil,
          postal_code: nil,
          address: nil,
          gender: nil,
        }
      end

      context "encrypted_password_changed? がtrueの場合" do
        before do
          allow(user).to receive(:encrypted_password_changed?).and_return(true)
        end

        it "deviseカラム以外のバリデーションが実行されないこと" do
          expect(subject).to eq true
        end
      end

      context "encrypted_password_changed? がfalseの場合" do
        before do
          allow(user).to receive(:encrypted_password_changed?).and_return(false)
        end

        it "Userモデルに定義したバリデーションが実行されること" do
          expect(subject).to eq false
          expect(user.errors.full_messages).to contain_exactly(*%w[姓を入力してください
                                                                 名を入力してください
                                                                 せいを入力してください
                                                                 めいを入力してください
                                                                 生年月日を入力してください
                                                                 電話番号を入力してください
                                                                 郵便番号を入力してください
                                                                 住所を入力してください
                                                                 性別を入力してください])
        end
      end
    end
  end

  describe "#initial_setting_completed?" do
    subject { user.initial_setting_completed? }

    context "初期設定が完了している場合" do
      let!(:user) { create(:user) }

      before do
        create(:educational_background, user: user, update_count: 1)
        create(:employment_status, user: user, update_count: 1)
        create(:self_introduction, user: user, update_count: 1)
        create(:skill, user: user, update_count: 1)
      end

      it { is_expected.to eq true }
    end

    context "初期設定が完了していない場合" do
      context "usersテーブルの入力が完了していない場合" do
        # NOTE: on: :updateで検証済みのため1項目だけnilにする
        let!(:user) { create(:user, last_name: nil) }

        before do
          create(:educational_background, user: user, update_count: 1)
          create(:employment_status, user: user, update_count: 1)
          create(:self_introduction, user: user, update_count: 1)
          create(:skill, user: user, update_count: 1)
        end

        it { is_expected.to eq false }
      end

      context "usersテーブル以外の入力が完了していない場合" do
        let!(:user) { create(:user) }

        context "educational_backgroundsテーブルの入力のみ完了していない場合" do
          before do
            create(:educational_background, user: user, update_count: 0)

            create(:employment_status, user: user, update_count: 1)
            create(:self_introduction, user: user, update_count: 1)
            create(:skill, user: user, update_count: 1)
          end

          it { is_expected.to eq false }
        end

        context "employment_statusesテーブルの入力のみ完了していない場合" do
          before do
            create(:employment_status, user: user, update_count: 0)

            create(:educational_background, user: user, update_count: 1)
            create(:self_introduction, user: user, update_count: 1)
            create(:skill, user: user, update_count: 1)
          end

          it { is_expected.to eq false }
        end

        context "self_introductionsテーブルの入力のみ完了していない場合" do
          before do
            create(:self_introduction, user: user, update_count: 0)

            create(:educational_background, user: user, update_count: 1)
            create(:employment_status, user: user, update_count: 1)
            create(:skill, user: user, update_count: 1)
          end

          it { is_expected.to eq false }
        end

        context "skillsテーブルの入力のみ完了していない場合" do
          before do
            create(:skill, user: user, update_count: 0)

            create(:educational_background, user: user, update_count: 1)
            create(:employment_status, user: user, update_count: 1)
            create(:self_introduction, user: user, update_count: 1)
          end

          it { is_expected.to eq false }
        end
      end
    end
  end

  describe "soft_delete" do
    subject { user.soft_delete }

    let!(:user) do
      create(:user,
             last_name: "before_last_name",
             last_name_kana: "before_last_name_kana",
             first_name: "before_first_name",
             first_name_kana: "before_first_name_kana",
             birthday: Time.zone.parse("2000-01-01"),
             phone_number: "000-0000-0000",
             postal_code: "123-1234",
             address: "before_address",
             deleted_at: nil)
    end


    before "Userに関連するレコードを作成する" do
      create(:educational_background, user: user)
      create(:employment_status, user: user)
      create(:past_employment_status, user: user)
      create(:self_introduction, user: user)
      create(:double_job_experience, user: user)
      create(:bank_account, user: user)
      create(:skill, user: user)
    end

    it %w[deleted_atカラムに値が入ること
          Userテーブルのカラムがマスキングされていること].join(", ") do
      subject
      user.reload
      expect(user.deleted_at).not_to eq nil
      expect(user).to have_attributes(last_name: "退会済みユーザー",
                                      last_name_kana: "",
                                      first_name: "",
                                      first_name_kana: "",
                                      gender: nil,
                                      phone_number: "",
                                      postal_code: "",
                                      address: "",
                                      birthday: Date.new(1800, 1, 1))
    end

    it "Userに関連するモデルのレコードが削除されていること" do
      expect { subject }.to change { EducationalBackground.count }.by(-1)
                        .and change { EmploymentStatus.count }.by(-1)
                        .and change { PastEmploymentStatus.count }.by(-1)
                        .and change { SelfIntroduction.count }.by(-1)
                        .and change { DoubleJobExperience.count }.by(-1)
                        .and change { BankAccount.count }.by(-1)
                        .and change { Skill.count }.by(-1)
    end
  end
end
