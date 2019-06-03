# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_people, dependent: :destroy
  has_many :attendees, class_name: "Person", through: :group_people

  has_many :group_students, dependent: :nullify
  has_many :students, through: :group_students

  has_many :group_teachers, dependent: :nullify
  has_many :teachers, through: :group_teachers
end
