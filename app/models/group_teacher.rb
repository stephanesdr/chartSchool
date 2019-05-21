# frozen_string_literal: true

# == Schema Information
#
# Table name: group_teachers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#  teacher_id :bigint
#
# Indexes
#
#  index_group_teachers_on_group_id    (group_id)
#  index_group_teachers_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (teacher_id => teachers.id)
#

class GroupTeacher < ApplicationRecord
  belongs_to :group
  belongs_to :teacher
end
