# frozen_string_literal: true

# == Schema Information
#
# Table name: proposition_entries
#
#  id                                              :bigint           not null, primary key
#  estimated_work_time(月間希望労働時間(単位hour)) :integer
#  request(ご要望)                                 :text(65535)
#  status(応募の状態)                              :integer          default("pending"), not null
#  created_at                                      :datetime         not null
#  updated_at                                      :datetime         not null
#  proposition_id(案件ID)                          :bigint           not null
#  user_id(応募したユーザーID)                     :bigint           not null
#
# Indexes
#
#  index_proposition_entries_on_proposition_id  (proposition_id)
#  index_proposition_entries_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposition_id => propositions.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe PropositionEntry, type: :model do
  describe "next_status_label_i18n" do
    subject { entry.next_status_label_i18n }

    let!(:entry) { create(:proposition_entry, status: status) }

    context "`before_interview` の場合" do
      let(:status) { :before_interview }

      it %w[consideringがi18nで返却されること レコードは更新されていないこと].join(", ") do
        result = subject
        expect(result).to eq "選考中"
        expect(entry.reload.status).to eq "before_interview"
      end
    end

    context "`considering` の場合" do
      let(:status) { :considering }

      it %w[contractingがi18nで返却されること レコードは更新されていないこと].join(", ") do
        result = subject
        expect(result).to eq "契約中"
        expect(entry.reload.status).to eq "considering"
      end
    end

    context "`contracting` の場合" do
      let(:status) { :contracting }

      it %w[disbandedがi18nで返却されること レコードは更新されていないこと].join(", ") do
        result = subject
        expect(result).to eq "解約済み"
        expect(entry.reload.status).to eq "contracting"
      end
    end

    context "`rejected` の場合" do
      let(:status) { :rejected }

      it %w[nilが返却されること レコードは更新されていないこと].join(", ") do
        result = subject
        expect(result).to eq nil
        expect(entry.reload.status).to eq "rejected"
      end
    end

    context "`disbanded` の場合" do
      let(:status) { :disbanded }

      it %w[nilが返却されること レコードは更新されていないこと].join(", ") do
        result = subject
        expect(result).to eq nil
        expect(entry.reload.status).to eq "disbanded"
      end
    end
  end

  describe "update_next_status!" do
    subject { entry.update_next_status! }

    let!(:proposition) { create(:proposition) }
    let!(:entry) { create(:proposition_entry, proposition: proposition, status: status) }

    let!(:other_target_entries) do
      # 各ステータスのレコードを作成する
      described_class.statuses.keys.map do |enum_status|
        create(:proposition_entry, proposition: proposition, status: enum_status)
      end
    end

    context "現在のstatusがrejectedの場合" do
      let(:status) { "rejected" }

      it "例外が発生すること" do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "対象レコード & 他のレコードに影響がないこと" do
        subject rescue nil

        expect(entry.reload.status).to eq status
        other_result = PropositionEntry.where(id: other_target_entries.map(&:id)).group(:status).count
        expect(other_result).to eq({ before_interview: 1, considering: 1, contracting: 1, rejected: 1, disbanded: 1 }.with_indifferent_access)
        expect(entry.proposition.status).to eq "wanted" # このspecの対象ではないがspecを極力少なくしたいのでここで検証する
      end
    end

    context "現在のstatusがdisbandedの場合" do
      let(:status) { "disbanded" }

      it "例外が発生すること" do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "対象レコード & 他のレコードに影響がないこと" do
        subject rescue nil

        expect(entry.reload.status).to eq status
        other_result = PropositionEntry.where(id: other_target_entries.map(&:id)).group(:status).count
        expect(other_result).to eq({ before_interview: 1, considering: 1, contracting: 1, rejected: 1, disbanded: 1 }.with_indifferent_access)
        expect(entry.proposition.status).to eq "wanted" # このspecの対象ではないがspecを極力少なくしたいのでここで検証する
      end
    end

    context "before_interview => considering に更新される場合" do
      let(:status) { "before_interview" }
      let(:expected_status) { "considering" }

      it %w[対象レコードが更新されていること 他のレコードが更新されていないこと].join(", ") do
        subject

        expect(entry.reload.status).to eq expected_status
        other_result = PropositionEntry.where(id: other_target_entries.map(&:id)).group(:status).count
        expect(other_result).to eq({ before_interview: 1, considering: 1, contracting: 1, rejected: 1, disbanded: 1 }.with_indifferent_access)
        expect(entry.proposition.status).to eq "wanted" # このspecの対象ではないがspecを極力少なくしたいのでここで検証する
      end
    end

    context "considering => contracting に更新される場合" do
      let(:status) { "considering" }
      let(:expected_status) { "contracting" }

      it %w[対象レコードが更新されていること
            他のレコードが更新されていること
            PropositionContractが1件作成されていること
            Attendanceが1件作成されていること].join(", ") do
        subject

        expect(entry.reload.status).to eq expected_status
        other_result = PropositionEntry.where(id: other_target_entries.map(&:id)).group(:status).count
        expect(other_result).to eq({ rejected: 5 }.with_indifferent_access)
        expect(entry.proposition.status).to eq "contracted" # このspecの対象ではないがspecを極力少なくしたいのでここで検証する
        expect(PropositionContract.count).to eq 1
        expect(Attendance.count).to eq 1
      end
    end

    context "contracting => disbanded に更新される場合" do
      let(:status) { "contracting" }
      let(:expected_status) { "disbanded" }

      # NOTE: 仕様的には 契約中 にした時点で他のentry全て お見送り に更新されているはずなのでユースケースとしてはありえない
      it %w[対象レコードが更新されていること 他のレコードが更新されていること].join(", ") do
        subject

        expect(entry.reload.status).to eq expected_status
        other_result = PropositionEntry.where(id: other_target_entries.map(&:id)).group(:status).count
        expect(other_result).to eq({ before_interview: 1, considering: 1, contracting: 1, rejected: 1, disbanded: 1 }.with_indifferent_access)
        expect(entry.proposition.status).to eq "wanted" # このspecの対象ではないがspecを極力少なくしたいのでここで検証する
      end
    end
  end
end
