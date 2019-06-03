# frozen_string_literal: true

class AttendancesController < ApplicationController
  def create
    if Person.where(email: params[:email]).exists?
      attendee = Person.find_by(email: params[:email])
      @attendance = Attendance.create(attendee: attendee, course: Course.find(params[:course_id])) unless Attendance.where(attendee: attendee, course: Course.find(params[:course_id])).exists?
    else
      @attendance = PendingAttendance.create(email: params[:email], course: Course.find(params[:course_id])) unless PendingAttendance.where(email: params[:email], course: Course.find(params[:course_id])).exists?
    end
    redirect_to request.referer
  end
end
