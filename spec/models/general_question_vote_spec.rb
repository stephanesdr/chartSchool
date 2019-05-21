# frozen_string_literal: true

# == Schema Information
#
# Table name: general_question_votes
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  general_question_id :bigint
#  student_id          :bigint
#
# Indexes
#
#  index_general_question_votes_on_general_question_id  (general_question_id)
#  index_general_question_votes_on_student_id           (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (general_question_id => general_questions.id)
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe GeneralQuestionVote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
