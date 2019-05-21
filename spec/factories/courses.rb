# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  description :text
#  end_time    :datetime
#  resource    :text
#  start_time  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  teacher_id  :bigint
#
# Indexes
#
#  index_courses_on_teacher_id  (teacher_id)
#

FactoryBot.define do
  factory :course do
    title { Faker::Educator.subject }
    resource { Faker::GreekPhilosophers.quote }
    start_time { Time.zone.now }
    end_time { Faker::Date.forward(24) }
    description { Faker::Books::Lovecraft.paragraph_by_chars }
  end
end
