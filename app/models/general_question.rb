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
#  course_id     :bigint
#  student_id    :bigint
#
# Indexes
#
#  index_general_questions_on_course_id   (course_id)
#  index_general_questions_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (student_id => students.id)
#

class GeneralQuestion < ApplicationRecord
  belongs_to :course
  belongs_to :student
  has_many :general_question_votes, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: false
end
