# frozen_string_literal: true

class StepsController < ApplicationController
  def create
    @step = Step.create(course_id: params[:course_id], title: params[:title], description: params[:description])
    redirect_to request.referer
  end
end
