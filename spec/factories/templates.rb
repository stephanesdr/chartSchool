# frozen_string_literal: true

# == Schema Information
#
# Table name: templates
#
#  id          :bigint           not null, primary key
#  description :text
#  resource    :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  person_id   :bigint
#
# Indexes
#
#  index_templates_on_person_id  (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#

FactoryBot.define do
  factory :template do
    title { Faker::Educator.subject }
    resource { Faker::GreekPhilosophers.quote }
    description { Faker::Books::Lovecraft.paragraph_by_chars }
    person { FactoryBot.create(:teacher) }
  end
end
