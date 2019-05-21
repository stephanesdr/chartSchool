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

require 'rails_helper'

RSpec.describe GroupStudent, type: :model do
  let(:group_student) { FactoryBot.build(:group_student) }

  describe 'Model instantiation' do
    subject(:new_group_student) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:student_id).of_type(:integer) }
      it { is_expected.to have_db_column(:group_id).of_type(:integer) }
    end
  end

  context "when Model is associated" do
    describe "Group" do
      it { expect(group_student).to belong_to(:group) }
    end

    describe "Student" do
      it { expect(group_student).to belong_to(:student) }
    end
  end
end
