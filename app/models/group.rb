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
  # validates :title, presence: true
  has_many :group_students, dependent: :destroy
  has_many :students, through: :group_students
end
