# frozen_string_literal: true

class StudentMailer < ApplicationMailer
  default from: 'info.chartschool@gmail.com'

  def invitation(attendance)
    # @student = attendance.student

    @student = attendance.attendee
    @course = attendance.course
    @teacher = @course.creator
    # @teacher = @course.teacher

    mail(to: @student.email, subject: 'Vous êtes invité à suivre un cours')
  end

  def unregistered_invitation(attendance)
    @course = attendance.course
    # @teacher = @course.teacher
    @teacher = @course.creator

    mail(to: attendance.email, subject: 'Vous êtes invité à rejoindre la platforme ChartSchool')
  end
end
