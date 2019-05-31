# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    @people = Person.all
  end
end
