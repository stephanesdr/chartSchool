# frozen_string_literal: true

# == Schema Information
#
# Table name: general_question_votes
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  attendee_id         :bigint
#  general_question_id :bigint
#  student_id          :bigint
#
# Indexes
#
#  index_general_question_votes_on_attendee_id          (attendee_id)
#  index_general_question_votes_on_general_question_id  (general_question_id)
#  index_general_question_votes_on_student_id           (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendee_id => people.id)
#  fk_rails_...  (general_question_id => general_questions.id)
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe GeneralQuestionVote, type: :model do
  let(:general_question_vote) { FactoryBot.build(:general_question_vote) }

  describe 'Model instantiation' do
    subject(:new_general_question_vote) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:general_question_id).of_type(:integer) }
      it { is_expected.to have_db_column(:student_id).of_type(:integer) }
    end
  end

  describe "General Question" do
    it { expect(general_question_vote).to belong_to(:general_question) }
  end

  describe "Student" do
    it { expect(general_question_vote).to belong_to(:student) }
  end
end
