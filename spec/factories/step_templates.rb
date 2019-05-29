# frozen_string_literal: true

# == Schema Information
#
# Table name: step_templates
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  template_id :bigint
#
# Indexes
#
#  index_step_templates_on_template_id  (template_id)
#
# Foreign Keys
#
#  fk_rails_...  (template_id => templates.id)
#

FactoryBot.define do
  factory :step_template do
    title { Faker::Educator.subject }
    description { Faker::GreekPhilosophers.quote }
    template { FactoryBot.create(:template) }
  end
end
