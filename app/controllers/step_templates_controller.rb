# frozen_string_literal: true

class StepTemplatesController < ApplicationController
  def create
    @step = StepTemplate.create(template_id: params[:template_id], title: params[:title], description: params[:description])
    redirect_to request.referer
  end
end
