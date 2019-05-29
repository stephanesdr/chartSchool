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
  has_many :courses, inverse_of: :creator, dependent: :destroy
  has_many :attendances, inverse_of: :attendee, dependent: :destroy
  has_many :courses, through: :attendances
  has_many :general_questions, dependent: :destroy
  has_many :step_students, dependent: :destroy
  has_many :steps, through: :step_students
  has_many :templates, dependent: :destroy
end
