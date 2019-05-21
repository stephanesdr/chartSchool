# frozen_string_literal: true

class StepsStudentsController < ApplicationController
  def create
    @step_student = StepStudent.create(student: current_student, step: Step.find(params[:step_id]))
    redirect_to request.referer
  end

  def destroy
    @step_student = StepStudent.find(params[:id])
    @step_student.destroy
    redirect_to request.referer
  end
end
