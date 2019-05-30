# frozen_string_literal: true

class GeneralQuestionVotesController < ApplicationController
  def create
    attendee = current_person
    attendee_hasnot_voted = GeneralQuestionVote.where(attendee_id: attendee.id, general_question_id: params[:general_question_id]).count.zero?

    return GeneralQuestionVote.create!(general_question_id: params[:general_question_id], attendee_id: attendee.id) if attendee_hasnot_voted

    # redirect_to request.referer
  end

  def destroy
    attendee = current_person
    @vote = GeneralQuestionVote.where(attendee_id: attendee.id, general_question_id: params[:id])

    GeneralQuestionVote.delete(@vote) if @vote.present?
  end
end
