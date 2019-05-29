# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  description :text
#  end_time    :datetime
#  resource    :text
#  start_time  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :bigint
#  teacher_id  :bigint
#
# Indexes
#
#  index_courses_on_creator_id  (creator_id)
#  index_courses_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => people.id)
#

class Course < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :attendees, class_name: "Person", through: :attendances

  has_many :students, through: :attendances
  belongs_to :teacher, optional: true

  belongs_to :creator, class_name: "Person"

  has_many :general_questions, dependent: :destroy
  has_many :pending_attendances, dependent: :destroy

  validates :title, presence: true
  validate :date_cannot_be_in_the_past

  # has_many :steps, dependent: :destroy

  def date_cannot_be_in_the_past
    if end_time.present? && end_time < Time.zone.today
      errors.add(:end_time, "end_date can't be in the past")
    elsif start_time.present? && start_time < Time.zone.today
      errors.add(:start_time, "start_date can't be in the past")
    end
  end
end
