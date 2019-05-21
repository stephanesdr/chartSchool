# frozen_string_literal: true

# == Schema Information
#
# Table name: general_questions
#
#  id            :bigint           not null, primary key
#  description   :text
#  teacher_check :boolean          default(FALSE)
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :bigint
#  student_id    :bigint
#
# Indexes
#
#  index_general_questions_on_course_id   (course_id)
#  index_general_questions_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe GeneralQuestion, type: :model do
  let(:course) { FactoryBot.build(:course) }
  let(:general_question) { FactoryBot.build(:general_question) }

  describe 'Model instantiation' do
    subject(:new_general_question) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:title).of_type(:string) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to have_db_column(:teacher_check).of_type(:boolean) }
    end
  end

  describe 'Connexion' do
    it { is_expected.to have_many :general_question_votes }
    it { is_expected.to belong_to :course }
  end
end
