class TemplateCourseController < ApplicationController
  def create
    template = Template.find(params[:template_id])
    course = Course.create(title: template.title, description: template.description, resource: template.resource, creator: current_person)
    template.step_templates.each do |step|
      Step.create(course: course, title: step.title, description: step.description)
    end
  end
end
