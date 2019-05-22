# frozen_string_literal: true

class AttendancesController < ApplicationController
  def create
    if Student.where(email: params[:email]).exists?
      student = Student.find_by(email: params[:email])
      @attendance = Attendance.create(student: student, course: Course.find(params[:course_id]))
    else
      @attendance = PendingAttendance.create(email: params[:email], course: Course.find(params[:course_id]))
    end
    redirect_to request.referer
  end
end
