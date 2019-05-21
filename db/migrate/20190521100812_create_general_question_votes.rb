# frozen_string_literal: true

class CreateGeneralQuestionVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :general_question_votes do |t|
      t.references :general_question, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
