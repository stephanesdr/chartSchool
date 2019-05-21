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

require 'rails_helper'

RSpec.describe GroupTeacher, type: :model do
  let(:group_teacher) { FactoryBot.build(:group_teacher) }

  describe 'Model instantiation' do
    subject(:new_group_teacher) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:teacher_id).of_type(:integer) }
      it { is_expected.to have_db_column(:group_id).of_type(:integer) }
    end
  end

  context "when Model is associated" do
    describe "Group" do
      it { expect(group_teacher).to belong_to(:group) }
    end

    describe "teacher" do
      it { expect(group_teacher).to belong_to(:teacher) }
    end
  end
end
