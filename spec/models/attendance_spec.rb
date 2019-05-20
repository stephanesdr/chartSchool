# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  student_id :bigint
#
# Indexes
#
#  index_attendances_on_course_id   (course_id)
#  index_attendances_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:attendance) { FactoryBot.build(:attendance) }

  describe 'Model instantiation' do
    subject(:new_attendance) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:student_id).of_type(:integer) }
      it { is_expected.to have_db_column(:course_id).of_type(:integer) }
    end
  end

  context "when Model is associated" do
    describe "Course" do
      it { expect(attendance).to belong_to(:course) }
    end

    describe "Student" do
      it { expect(attendance).to belong_to(:student) }
    end
  end
end
