# frozen_string_literal: true

# == Schema Information
#
# Table name: step_students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  step_id    :bigint
#  student_id :bigint
#
# Indexes
#
#  by_step_and_student                (step_id,student_id) UNIQUE
#  index_step_students_on_step_id     (step_id)
#  index_step_students_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (step_id => steps.id)
#  fk_rails_...  (student_id => students.id)
#

FactoryBot.define do
  factory :step_student do
    step_id { 1 }
    student_id { 1 }
  end
end
