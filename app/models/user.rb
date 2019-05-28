# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  confirmed_at :datetime
#  email        :string
#  name         :string
#  password     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  has_many :attendances, foreign_key: 'attendee_id', dependent: :nullify
  has_many :general_questions, foreign_key: 'attendee_id', class_name: "GeneralQuestion", dependent: :nullify
  has_many :general_question_votes, foreign_key: 'attendee_id', class_name: "GeneralQuestionVote", dependent: :nullify
  has_many :courses, foreign_key: 'creator_id', class_name: "Course", dependent: :nullify
end
