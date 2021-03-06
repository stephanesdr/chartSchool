# frozen_string_literal: true

# == Schema Information
#
# Table name: step_people
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :bigint
#  step_id     :bigint
#
# Indexes
#
#  index_step_people_on_attendee_id  (attendee_id)
#  index_step_people_on_step_id      (step_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendee_id => people.id)
#  fk_rails_...  (step_id => steps.id)
#

require 'rails_helper'

RSpec.describe StepPerson, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
