# frozen_string_literal: true

class GeneralQuestionsController < ApplicationController
  def index
    # current_user = current_teacher || current_student
    @questions = GeneralQuestion.where(course_id: params[:course_id])
  end

  def new; end

  def create
    student = current_student || Student.last
    GeneralQuestion.create!(
      title: params[:title],
      description: params[:description],
      course_id: params[:course_id],
      student_id: student.id
    )
    redirect_to request.referer
  end

  def show; end
end
