# frozen_string_literal: true

# == Schema Information
#
# Table name: general_question_votes
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  attendee_id         :bigint
#  general_question_id :bigint
#  student_id          :bigint
#
# Indexes
#
#  index_general_question_votes_on_attendee_id          (attendee_id)
#  index_general_question_votes_on_general_question_id  (general_question_id)
#  index_general_question_votes_on_student_id           (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendee_id => people.id)
#  fk_rails_...  (general_question_id => general_questions.id)
#  fk_rails_...  (student_id => students.id)
#

class GeneralQuestionVote < ApplicationRecord
  belongs_to :general_question
  belongs_to :student, optional: true
  belongs_to :attendee, class_name: "Person"
end
