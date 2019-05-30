# frozen_string_literal: true

class StepsPeopleController < ApplicationController
  def create
    @step_student = StepPerson.create(attendee: current_person, step: Step.find(params[:step_id]))
    redirect_to request.referer
  end

  def destroy
    @step_student = StepPerson.find(params[:id])
    @step_student.destroy
    redirect_to request.referer
  end
end
