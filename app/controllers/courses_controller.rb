# frozen_string_literal: true

class CoursesController < ApplicationController
  include CoursesHelper
  before_action :log_person, only: %i[new create show]
  before_action :not_authorized_person, only: %i[show]

  def new
    @courses = Course.all
  end

  def create
    start_time = params[:start_time] + " " + params[:start_hour].first
    end_time = params[:end_time] + " " + params[:end_hour].first
    @course = Course.create(title: params[:title], description: params[:description], resource: params[:resource], start_time: start_time, end_time: end_time, creator: current_person)
    if @course.errors.any?
      flash[:warning] = "Echec de création de cours, veuillez à ce que tout les champs soit correctement rempli"
      redirect_to request.referer
    elsif flash[:notice] = "Cours correctement créé"
      redirect_to course_path(@course)
    end
  end

  def show
    @course = Course.find(params[:id])
    @steps = Step.where(course_id: @course)
    @students = @course.attendees

    @questions = GeneralQuestion.where(course_id: @course.id).sort_by(&:vote_number).reverse
    @votes = GeneralQuestionVote.all
    # gon.watch.votes = @votes
    gon.watch.questions = @questions.as_json(include: [:general_question_votes])
    gon.initial_questions_count = @questions.count

    gon.user = current_person
    @is_teacher = @course.creator == current_person
    @is_student = current_person.courses_as_attendee.include?(@course)

    if @is_teacher
      gon.teacher = current_person
    elsif @is_student
      gon.student = current_person
    end

    @teacher = current_person
    @student = current_person

    gon.watch.steps = @steps.as_json(include: [:step_people])
    gon.watch.course = @course.as_json(include: [:attendances])
    gon.course = @course
  end

  def index
    @courses = Course.all

    @archived_courses_as_attendee = current_person.archived_courses if current_person
    @pending_courses_as_attendee = current_person.pending_courses.reject { |course| course.creator == current_person } if current_person

    @archived_courses_as_teacher = current_person.archived_courses.select { |course| course.creator == current_person } if current_person
    @pending_courses_as_teacher = current_person.pending_courses.select { |course| course.creator == current_person } if current_person

    @teacher = current_person
    @student = current_person
  end

  def archived_courses
    @archived_courses_as_attendee = current_person.archived_courses.reject { |course| course.creator == current_person } if current_person

    @archived_courses_as_teacher = current_person.archived_courses.select { |course| course.creator == current_person } if current_person
  end
end
