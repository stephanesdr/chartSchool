# frozen_string_literal: true

class CourseTemplateController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    template = Template.create(title: course.title, description: course.description, resource: course.resource, person: course.creator)
    course.steps.each do |step|
      StepTemplate.create(template: template, title: step.title, description: step.description)
    end
    redirect_to template_path(template.id)
  end
end
