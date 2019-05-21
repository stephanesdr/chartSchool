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

FactoryBot.define do
  factory :step do
    title { Faker::Educator.subject }
    description { Faker::GreekPhilosophers.quote }
    teacher_check { false }
    course { FactoryBot.create(:course) }
  end
end
