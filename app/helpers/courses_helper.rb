# frozen_string_literal: true

module CoursesHelper
  def not_authorized_person
    redirect_to home_index_path unless current_person.id == Course.find(params[:id]).creator.id || Attendance.where(course: Course.find(params[:id]), attendee: current_person).exists?
  end

  def log_person
    redirect_to root_path unless current_person
  end
end
