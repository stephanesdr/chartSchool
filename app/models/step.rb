# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id            :bigint           not null, primary key
#  description   :text
#  teacher_check :boolean          default(FALSE)
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :bigint
#
# Indexes
#
#  index_steps_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

class Step < ApplicationRecord
  validates :title, presence: true
  has_many :step_students, dependent: :destroy
  has_many :students, through: :step_students
  belongs_to :course

  def percentage
    (students.length.to_f / course.attendances.length.to_f * 100).round(2) if !course.attendances.empty?
  end
end
