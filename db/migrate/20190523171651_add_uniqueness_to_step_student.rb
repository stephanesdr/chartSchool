# frozen_string_literal: true

class AddUniquenessToStepStudent < ActiveRecord::Migration[5.2]
  def change
    add_index :step_students, %i[step_id student_id], unique: true, name: 'by_step_and_student'
  end
end
