# frozen_string_literal: true

# == Schema Information
#
# Table name: general_questions
#
#  id            :bigint           not null, primary key
#  description   :text
#  teacher_check :boolean          default(FALSE)
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GeneralQuestion < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
