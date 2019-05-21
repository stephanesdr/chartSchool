# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id            :bigint           not null, primary key
#  description   :text
#  teacher_check :boolean          default(FALSE)
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Step < ApplicationRecord
  validates :title, presence: true
end
