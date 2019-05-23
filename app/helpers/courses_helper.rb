# frozen_string_literal: true

module CoursesHelper
  def no_unregistered_student
    authenticate_student! unless current_teacher
  end

  def not_authorized_teacher
    return unless current_teacher

    redirect_to root_path if current_teacher.id != Course.find(params[:id]).teacher.id
  end

  def not_authorized_student
    return unless current_student

    redirect_to root_path unless Attendance.where(course: Course.find(params[:id]), student: current_student).exists?
  end
end
