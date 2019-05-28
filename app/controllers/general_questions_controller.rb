# frozen_string_literal: true

class GeneralQuestionsController < ApplicationController
  # def index
  #   # current_user = current_teacher || current_student
  #   @teacher = current_teacher # || Teacher.last
  #   @student = current_student # || Student.last
  #   @course = Course.find(params[:course_id])
  #   @questions = GeneralQuestion.where(course_id: params[:course_id])
  # end

  def update
    @question = GeneralQuestion.find(params[:id])
    @question.update( teacher_check: params[:teacher_check] )
    # redirect_to request.referer
  end

  def create
    student = current_student # || Student.last
    @question = GeneralQuestion.new(
      title: params[:title],
      description: params[:description],
      course_id: params[:course_id],
      student_id: student.id
    )

    if @question.save
      @general_question_votes = @question.general_question_votes.count
      respond_to do |format|
        format.js
      end

    else
      flash[:notice] = "Il manque un titre à ta question."
    end
    # redirect_to request.referer
  end

  def destroy
    @question = GeneralQuestion.find(params[:id])

    if @question.present?
      GeneralQuestionVote.where(general_question_id: @question.id).each { |vote| GeneralQuestionVote.delete(vote) }
      GeneralQuestion.delete(@question)
      # redirect_to request.referer
    end
  end
end
