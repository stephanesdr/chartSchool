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
#

FactoryBot.define do
  factory :step do
    title { Faker::Educator.subject }
    description { Faker::GreekPhilosophers.quote }
    teacher_check { false }
  end
end
