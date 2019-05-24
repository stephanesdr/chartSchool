# frozen_string_literal: true

class GeneralQuestionVotesController < ApplicationController
  def create
    student = current_student # || Student.last
    student_hasnot_voted = GeneralQuestionVote.where(student_id: student.id, general_question_id: params[:general_question_id]).count.zero?

    return GeneralQuestionVote.create!(general_question_id: params[:general_question_id], student_id: student.id) if student_hasnot_voted

    # redirect_to request.referer
  end

  def destroy
    student = current_student # || Student.last
    @vote = GeneralQuestionVote.where(student_id: student.id, general_question_id: params[:id])

    GeneralQuestionVote.delete(@vote) if @vote.present?
  end
end
