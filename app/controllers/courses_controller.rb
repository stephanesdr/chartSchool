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
  end

  def index
    @courses = Course.all

    return @archived_courses = current_teacher.archived_courses if current_teacher
    return @pending_courses = current_teacher.pending_courses if current_teacher

    return @archived_courses = current_student.archived_courses if current_student
    return @pending_courses = current_student.pending_courses if current_student
  end
end
