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

class Template < ApplicationRecord
  belongs_to :person
  has_many :step_templates, dependent: :destroy
  validates :title, presence: true
end
