# frozen_string_literal: true

class StepsPeopleController < ApplicationController
  def create
    if StepPerson.where(step_id: params[:step_id], attendee_id: current_person.id).empty?
      @step_student = StepPerson.create(attendee: current_person, step: Step.find(params[:step_id]))
      # redirect_to request.referer
    end
  end

  def destroy
    @step_student = StepPerson.where(step_id: params[:id], attendee_id: current_person.id)[0]
    @step_student.destroy
    # redirect_to request.referer
  end
end
