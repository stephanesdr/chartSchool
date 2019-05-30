# frozen_string_literal: true

# == Schema Information
#
# Table name: group_people
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :bigint
#  group_id    :bigint
#
# Indexes
#
#  index_group_people_on_attendee_id  (attendee_id)
#  index_group_people_on_group_id     (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendee_id => people.id)
#  fk_rails_...  (group_id => groups.id)
#

require 'rails_helper'

RSpec.describe GroupPerson, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
