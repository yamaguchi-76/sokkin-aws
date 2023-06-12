# frozen_string_literal: true

module ApplicationHelper
  def active_page?(*paths)
    paths.any? { |path| current_page?(path) } ? " active" : ""
  end

  def view_skills(skill)
    return "" unless skill

    ary = []
    ary.push("プランナー") if skill.planner
    ary.push("メディアコンサルタント") if skill.media_consultant
    ary.push("運用オペレーター") if skill.operation_operator
    ary.push("デザイナー") if skill.designer
    ary.push("ディレクター") if skill.director
    ary.push("エンジニア") if skill.engineer
    ary.join(",")
  end
end
