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
#

FactoryBot.define do
  factory :course do
    title { Faker::Educator.subject }
    resource { Faker::GreekPhilosophers.quote }
    start_time { Faker::Date.forward(23) }
    end_time { Faker::Date.forward(24) }
    description { Faker::Books::Lovecraft.paragraph_by_chars }
  end
end
