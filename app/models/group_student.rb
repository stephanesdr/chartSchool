# frozen_string_literal: true

# == Schema Information
#
# Table name: group_students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#  student_id :bigint
#
# Indexes
#
#  index_group_students_on_group_id    (group_id)
#  index_group_students_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (student_id => students.id)
#

class GroupStudent < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :group
end
