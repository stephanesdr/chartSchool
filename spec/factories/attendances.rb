# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :bigint
#  course_id   :bigint
#  student_id  :bigint
#
# Indexes
#
#  by_course_and_student             (course_id,student_id) UNIQUE
#  index_attendances_on_attendee_id  (attendee_id)
#  index_attendances_on_course_id    (course_id)
#  index_attendances_on_student_id   (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendee_id => people.id)
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (student_id => students.id)
#

FactoryBot.define do
  factory :attendance do
    student_id { 1 }
    course_id { 1 }
  end
end
