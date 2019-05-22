# frozen_string_literal: true

class AttendancesController < ApplicationController
  def create
    puts params
    student = Student.find_by(email: params[:email])
    @attendance = Attendance.create(student: student, course: Course.find(params[:course_id]))
    redirect_to request.referer
  end
end
