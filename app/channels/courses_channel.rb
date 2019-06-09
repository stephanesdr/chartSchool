# frozen_string_literal: true

class CoursesChannel < ApplicationCable::Channel
  def subscribed
    @course = Course.find(params[:id])
    stream_from "course_#{@course.id}"

    # ActionCable.server.broadcast("course_#{@course.id}", { content: "VOUSE ETES CONNECTÉ AU CHANNEL : #{current_person.name}"})
    # puts "****salut les putes !"
  end

  def unsubscribed(_data)
    # Any cleanup needed when channel is unsubscribed
    # stream_from "course_#{params[:id]}"
    ActionCable.server.broadcast("course_#{params[:id]}", content: "ceci est un au revoir ", user_id: current_person.id.to_s)
  end
end
