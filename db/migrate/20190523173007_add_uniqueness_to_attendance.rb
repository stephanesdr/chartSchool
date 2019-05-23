# frozen_string_literal: true

class AddUniquenessToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_index :attendances, %i[course_id student_id], unique: true, name: 'by_course_and_student'
  end
end
