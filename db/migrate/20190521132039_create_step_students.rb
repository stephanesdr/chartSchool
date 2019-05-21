# frozen_string_literal: true

class CreateStepStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :step_students do |t|
      t.references :student, foreign_key: true
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
