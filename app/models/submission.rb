# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :proposition
end
