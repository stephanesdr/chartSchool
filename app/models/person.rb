# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_people_on_email                 (email) UNIQUE
#  index_people_on_reset_password_token  (reset_password_token) UNIQUE
#

class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email not valid"
            }
  validates :name, presence: true
  has_many :templates, dependent: :destroy
  has_many :step_people, dependent: :destroy
  has_many :steps, through: :step_people

  has_many :group_people, dependent: :destroy
  has_many :groups, through: :group_people

  has_many :attendances, foreign_key: 'attendee_id', dependent: :nullify
  has_many :courses, foreign_key: 'attendee_id', through: :attendances

  has_many :general_questions, foreign_key: 'attendee_id', class_name: "GeneralQuestion", dependent: :nullify
  has_many :general_question_votes, foreign_key: 'attendee_id', class_name: "GeneralQuestionVote", dependent: :nullify

  has_many :courses, foreign_key: 'creator_id', class_name: "Course", dependent: :nullify

  def courses_as_attendee
    arr = []
    Attendance.where(attendee_id: id).find_each { |atd| arr << atd.course }
    arr
  end

  def courses_as_creator
    Course.where(creator_id: id)
  end

  def all_courses
    arr = []
    Attendance.where(attendee_id: id).find_each { |atd| arr << atd.course }
    Course.where(creator_id: id).find_each { |course| arr << course }
    arr
  end

  def archived_courses
    archived = []
    all_courses.each do |course|
      next unless course.end_time < Time.zone.now

      archived << course
    end
  end

  def pending_courses
    pending = []
    all_courses.each do |course|
      next unless course.end_time > Time.zone.now

      pending << course
    end
  end
end
