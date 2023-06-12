# frozen_string_literal: true

namespace :update_count_to_user_relation_tables do
  desc "既存ユーザー向け案件閲覧可能な条件のテーブルのupdate_countを更新する"
  task run: :environment do |t|
    puts "更新開始"
    puts "educational_backgroundの更新"
    EducationalBackground.update_all(update_count: 1)
    puts "employment_statusの更新"
    EmploymentStatus.update_all(update_count: 1)
    puts "self_introductionの更新"
    SelfIntroduction.update_all(update_count: 1)
    puts "skillの更新"
    Skill.update_all(update_count: 1)
    puts "更新完了"
  end
end
