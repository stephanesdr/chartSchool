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
  after_create :pending_attendances?
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

  has_many :step_people, foreign_key: :attendee_id, dependent: :destroy
  has_many :steps, through: :step_people

  has_many :group_people, foreign_key: :attendee_id, dependent: :destroy
  has_many :groups, through: :group_people

  has_many :attendances, foreign_key: 'attendee_id', dependent: :destroy
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

  def count_courses_as_creator
    Course.where(creator_id: id).count
  end

  def all_courses
    arr = []
    Attendance.where(attendee_id: id).find_each { |atd| arr << atd.course } if Attendance.where(attendee_id: id).present?
    Course.where(creator_id: id).find_each { |course| arr << course } if Course.where(creator_id: id).present?
    arr
  end

  def archived_courses
    archived = []
    all_courses.each do |course|
      archived << course if course.end_time < Time.zone.now
    end
    archived
  end

  def pending_courses
    pending = []
    all_courses.each do |course|
      pending << course if course.start_time > Time.zone.now
    end
    pending
  end

  def pending_attendances?
    return unless PendingAttendance.where(email: email).exists?

    PendingAttendance.where(email: email).find_each do |pending|
      Attendance.create(attendee: self, course: pending.course)
      pending.destroy
    end
  end

  def my_groups
    person_groups = []
    GroupPerson.where(attendee_id: id).find_each do |group_person|
      person_groups << group_person.group
    end
    person_groups
  end
end
