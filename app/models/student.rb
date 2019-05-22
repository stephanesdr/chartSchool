# frozen_string_literal: true

# == Schema Information
#
# Table name: students
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
#  index_students_on_confirmation_token    (confirmation_token) UNIQUE
#  index_students_on_email                 (email) UNIQUE
#  index_students_on_reset_password_token  (reset_password_token) UNIQUE
#

class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :attendances, dependent: :destroy
  has_many :courses, through: :attendances

  has_many :general_questions, dependent: :destroy

  has_many :group_students, dependent: :destroy
  has_many :groups, through: :group_students

  has_many :step_students, dependent: :destroy
  has_many :steps, through: :step_students

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email not valid"
            }
  validates :name, presence: true

  def archived_courses
    archived = []
    courses.each do |course|
      if course.end_time < Time.zone.now
        archived << course
      end
    end
  end

  def pending_courses
    pending = []
    courses.each do |course|
      if course.end_time > Time.zone.now
        pending << course
      end
    end
  end
end
