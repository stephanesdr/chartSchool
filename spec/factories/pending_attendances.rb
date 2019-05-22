# frozen_string_literal: true

# == Schema Information
#
# Table name: pending_attendances
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#
# Indexes
#
#  index_pending_attendances_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

FactoryBot.define do
  factory :pending_attendance do
    email { Faker::Internet.email }
    course { FactoryBot.create(:course) }
  end
end
