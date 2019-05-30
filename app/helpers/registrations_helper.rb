# frozen_string_literal: true

module RegistrationsHelper
  def resource_name
    :person
  end

  def resource
    @resource ||= Person.new
  end

  def resource_class
    Person
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:person]
  end
end
