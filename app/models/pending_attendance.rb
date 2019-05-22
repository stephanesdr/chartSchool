# frozen_string_literal: true

# == Schema Information
#
# Table name: pending_attendances
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#
# Indexes
#
#  index_pending_attendances_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

class PendingAttendance < ApplicationRecord
  after_create :unregistered_invitation_send
  belongs_to :course

  def unregistered_invitation_send
    StudentMailer.unregistered_invitation(self).deliver_now
  end
end
