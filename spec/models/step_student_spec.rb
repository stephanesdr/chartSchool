# frozen_string_literal: true

# == Schema Information
#
# Table name: step_students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  step_id    :bigint
#  student_id :bigint
#
# Indexes
#
#  index_step_students_on_step_id     (step_id)
#  index_step_students_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (step_id => steps.id)
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe StepStudent, type: :model do
  let(:step_student) { FactoryBot.build(:step_student) }

  describe 'Model instantiation' do
    subject(:new_step_student) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:student_id).of_type(:integer) }
      it { is_expected.to have_db_column(:step_id).of_type(:integer) }
    end
  end

  context "when Model is associated" do
    describe "Step" do
      it { expect(step_student).to belong_to(:step) }
    end

    describe "Student" do
      it { expect(step_student).to belong_to(:student) }
    end
  end
end
