# frozen_string_literal: true

class AddTeacherToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :teacher, index: true
  end
end
