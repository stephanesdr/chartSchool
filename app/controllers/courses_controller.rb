# frozen_string_literal: true

class CoursesController < ApplicationController
  include CoursesHelper
  before_action :authenticate_teacher!, only: %i[new create]
  before_action :not_authorized_teacher, only: %i[show]
  before_action :not_authorized_student, only: %i[show]
  before_action :no_unregistered_student, only: %i[show]

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

    @questions = GeneralQuestion.where(course_id: @course.id)
    @votes = GeneralQuestionVote.all
    # gon.watch.votes = @votes
    gon.watch.questions = @questions.as_json(include: [:general_question_votes])
    gon.initial_questions_count = @questions.count
    gon.teacher = current_teacher
    gon.student = current_student
    gon.user = current_teacher || current_student
    @teacher = current_teacher # || Teacher.last
    @student = current_student # || Student.last
  end

  def index
    @courses = Course.all

    return @archived_courses = current_teacher.archived_courses if current_teacher
    return @pending_courses = current_teacher.pending_courses if current_teacher

    return @archived_courses = current_student.archived_courses if current_student
    return @pending_courses = current_student.pending_courses if current_student
  end
end
