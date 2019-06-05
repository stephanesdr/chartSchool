# frozen_string_literal: true

class HomeController < ApplicationController
  include CoursesHelper
  before_action :log_person, only: %i[index]

  def index; end
end
