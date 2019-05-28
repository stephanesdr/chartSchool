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
#  attendee_id   :bigint
#  course_id     :bigint
#  student_id    :bigint
#
# Indexes
#
#  index_general_questions_on_attendee_id  (attendee_id)
#  index_general_questions_on_course_id    (course_id)
#  index_general_questions_on_student_id   (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendee_id => users.id)
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (student_id => students.id)
#

FactoryBot.define do
  factory :general_question do
    title { "MyString" }
    description { "MyText" }
    teacher_check { false }
  end
end
