# frozen_string_literal: true

class UpdateJunctionTablesForUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :attendee, foreign_key: { to_table: :users }
    add_reference :general_questions, :attendee, foreign_key: { to_table: :users }
    add_reference :general_question_votes, :attendee, foreign_key: { to_table: :users }
    add_reference :courses, :creator, foreign_key: { to_table: :users }
  end
end
