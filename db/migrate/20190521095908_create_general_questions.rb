# frozen_string_literal: true

class CreateGeneralQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :general_questions do |t|
      t.string :title
      t.text :description
      t.boolean :teacher_check, default: false
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
