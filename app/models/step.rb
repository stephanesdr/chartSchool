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

  has_many :step_people, dependent: :destroy
  has_many :attendees, class_name: "Person", through: :step_people

  has_many :step_students, dependent: :nullify
  has_many :students, through: :step_students
  belongs_to :course

  def percentage
    (attendees.length.to_f / course.attendances.length.to_f * 100 ).round(2).clamp(0, 100) if !course.attendances.empty?
  end
end
