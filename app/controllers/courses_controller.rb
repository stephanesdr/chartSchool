# frozen_string_literal: true

class CoursesController < ApplicationController
  def new
    @courses = Course.all
  end

  def create
    start_time = params[:start_time] + " " + params[:start_hour].first
    end_time = params[:end_time] + " " + params[:end_hour].first
    @course = Course.create(title: params[:title], description: params[:description], resource: params[:resource], start_time: start_time, end_time: end_time, teacher: current_teacher)
    if @course.errors.any?
      flash[:warning] = "Echec de création de cours, veuillez à ce que tout les champs soit correctement rempli"
      redirect_to request.referer
    elsif flash[:notice] = "Cours correctement créé"
      redirect_to root_path
    end
  end

  def show
    @course = Course.find(params[:id])
    @steps = @course.steps
    @students = @course.students
  end
end
