# frozen_string_literal: true

# == Schema Information
#
# Table name: video_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VideoScope < ApplicationRecord
  has_many :skill_video_scopes, dependent: :destroy
  has_many :skills, through: :skill_video_scopes
end
