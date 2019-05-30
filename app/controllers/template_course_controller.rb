# frozen_string_literal: true

class TemplateCourseController < ApplicationController
  def create
    start_time = params[:start_time] + " " + params[:start_hour].first
    end_time = params[:end_time] + " " + params[:end_hour].first
    template = Template.find(params[:template_id])
    course = Course.create(title: template.title, description: template.description, resource: template.resource, creator: current_person, start_time: start_time, end_time: end_time)
    template.step_templates.each do |step|
      Step.create(course: course, title: step.title, description: step.description)
    end
    redirect_to course_path(course.id)
  end
end
