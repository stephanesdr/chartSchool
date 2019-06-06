# frozen_string_literal: true

module TemplatesHelper
  def not_the_creator
    redirect_to home_index_path unless current_person.id == Template.find(params[:id]).person.id
  end
end
