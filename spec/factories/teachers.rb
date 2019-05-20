# == Schema Information
#
# Table name: teachers
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
#  index_teachers_on_confirmation_token    (confirmation_token) UNIQUE
#  index_teachers_on_email                 (email) UNIQUE
#  index_teachers_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :teacher do
    
  end
end
